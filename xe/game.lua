--
local M = {}
M._ed = require('core_x.EventDispatcher').create()
local started
local paused
---@type cc.Node
local node
local NavEnableKeyboard
local NavEnableGamepad

function M.start(rank, player, stage_, debugStage, debugSC)
    if started then
        if paused then
            M.resume()
        end
        return true
    end
    started = true

    -- disable keyboard
    local flag = imgui.ConfigFlags.NavEnableKeyboard
    NavEnableKeyboard = imgui.configFlagCheck(flag)
    if NavEnableKeyboard then
        imgui.configFlagDisable(flag)
    end
    flag = imgui.ConfigFlags.NavEnableGamepad
    NavEnableGamepad = imgui.configFlagCheck(flag)
    if NavEnableGamepad then
        imgui.configFlagDisable(flag)
    end

    -- clear game log
    require('xe.main').getGameLog():clear()
    -- show game property
    require('xe.main').getProperty():setGame()

    -- clear tasks
    M._ed:removeAllListeners()
    -- reset frame
    FrameReset()

    lstg.eventDispatcher:removeAllListeners()
    setting.mod = '_editor_'
    setting.resx = 1280
    setting.resy = 720

    --

    local core = {
        'core/include.lua',
        'core_x/__init__.lua',

        'core/const.lua',
        'core/status.lua',
        'core/math.lua',
        --'core/respool.lua',
        --'core/resources.lua',
        'core/screen.lua',
        'core/view.lua',
        'core/class.lua',
        'core/task.lua',
        'core/stage.lua',
        'core/input.lua',
        'core/global.lua',
        'core/corefunc.lua',
        'core/file.lua',
        'core/loading.lua',
        'core/async.lua',
    }
    for _, f in ipairs(core) do
        DoFile(f)
    end
    FileExist = plus.FileExists
    lstg.loadData()
    require('platform.ControllerHelper').init()
    lstg.ResourceMgr:getInstance():clearLocalFileCache()

    --

    local game_util = require('game.util')
    local glv = cc.Director:getInstance():getOpenGLView()
    local dsize = glv:getDesignResolutionSize()
    local stage_name = 'menu'

    local stage_init = stage.New('init', true, true)
    function stage_init:init()
    end
    function stage_init:frame()
        stage.Set('none', stage_name)
    end
    function stage_init:render()
        SetViewMode('ui')
        RenderText('menu', 'stage_init', 320, 240, 1)
    end

    local inited = false
    local stage_menu = stage.New(stage_name, false, true)
    function stage_menu:init()
        local returnToLauncher = function()
            inited = false
            stage.current_stage = nil
            lstg.practice = nil
            game_util.stopAudios()
            -- restore
            glv:setDesignResolutionSize(
                    dsize.width, dsize.height, cc.ResolutionPolicy.SHOW_ALL)
            M._return()
        end
        if inited then
            --if self.save_replay then
            --    local menu_replay_saver
            --    menu_replay_saver = New(replay_saver, self.save_replay, self.finish, function()
            --        menu.FlyOut(menu_replay_saver, 'right')
            --        task.New(stage_menu, function()
            --            task.Wait(30)
            --            task.New(stage_menu, returnToLauncher)
            --        end)
            --    end)
            --    menu.FlyIn(menu_replay_saver, 'left')
            --else
            task.New(stage_menu, returnToLauncher)
            --end
        else
            inited = true
            game_util.enterStage(stage_menu, false)
        end
    end
    function stage_menu:frame()
    end
    function stage_menu:render()
    end

    --
    SetResourceStatus('global')
    --lstg.loadPlugins()

    lstg.eventDispatcher:dispatchEvent('load.THlib.before')
    Include 'THlib.lua'
    Include '_editor_output.lua'
    --M.loadStage()
    lstg.eventDispatcher:dispatchEvent('load.THlib.after')
    DoFile('core/score.lua')
    RegistClasses()
    --SetTitle(setting.mod)
    SetResourceStatus('stage')
    --
    local e = lstg.eventDispatcher
    e:removeListenerByTag('FrameReset')
    --e:removeListenerByTag('ext.FrameFunc')
    --
    local content = require('game.content')
    content._reset()

    local ranks, rank_names = content.enumRanks()
    for _, v in ipairs(ranks) do
        content.enumStages(v)
    end
    --print(stringify(ranks))
    --print(stringify(rank_names))

    local ok, msg
    ok, msg = content.setRank(rank or ranks[1])
    if not ok then
        return false, msg
    end
    ok, msg = content.setPlayer(player or 1)
    if not ok then
        return false, msg
    end
    --ok, msg = content.setStage(stage_ or 1)
    if debugStage then
        lstg.practice = 'stage'
        lstg.stage_name = debugStage
    elseif debugSC then
        --local spells = content.enumSpells()
        --lstg.practice = 'spell'
        lstg.practice = 'stage'
        M._defineSpellStage()
        lstg.stage_name = 'SC Debugger@SC Debugger'
    else
        ok, msg = content.setStage(stage_ or 1)
        if not ok then
            return false, msg
        end
        lstg.practice = nil
    end

    -- lstg.loadSetting
    glv:setDesignResolutionSize(
            setting.resx, setting.resy, cc.ResolutionPolicy.SHOW_ALL)
    SetSEVolume(setting.sevolume / 100)
    SetBGMVolume(setting.bgmvolume / 100)
    lstg.calcScreen()
    lstg.loadViewParams()
    _SetBound()

    if not node then
        node = cc.Node()
        node:addTo(cc.Director:getInstance():getRunningScene())
        node:scheduleUpdateWithPriorityLua(M._update, 0)
    end
    stage.next_stage = stage_menu
    require('xe.main').getEditor():setGame()

    return true
end

function M._update(dt)
    --
    local _
    _ = profiler and profiler.tic('FrameFunc')
    FrameFunc()
    _ = profiler and profiler.toc('FrameFunc')

    _ = profiler and profiler.tic('RenderFunc')
    RenderFunc()
    _ = profiler and profiler.toc('RenderFunc')

    M._ed:dispatchEvent('update')
end

function M._return()
    --
    M.stop()
end

local _FrameFunc = 'FrameFunc'
local _RenderFunc = 'RenderFunc'
local fvoid = function()
end

function M.stop()
    if not started then
        return
    end
    --
    if FrameFunc ~= fvoid then
        M._FrameFunc = FrameFunc
    end
    _G[_FrameFunc] = fvoid
    if RenderFunc ~= fvoid then
        M._RenderFunc = RenderFunc
    end
    _G[_RenderFunc] = fvoid
    --TODO: clear registered classes
    --all_class = {}
    --class_name = {}
    --
    --lstg.ResourceMgr:getInstance():clear()
    FrameReset()
    --
    lstg.included = {}
    lstg.current_script_path = { '' }
    lstg.eventDispatcher:removeAllListeners()
    --
    stage.current_stage = nil
    stage.next_stage = nil
    lstg.var = { username = setting.username }
    lstg.tmpvar = {}
    lstg.paused = false
    lstg.quit_flag = false
    -- clear resource pool
    RemoveResource('stage')
    RemoveResource('global')
    -- clear object pool
    ResetPool()
    --
    require('xe.main').getEditor():setEditor()
    require('xe.main').getProperty():setEditor()
    -- restore
    if NavEnableKeyboard then
        imgui.configFlagEnable(imgui.ConfigFlags.NavEnableKeyboard)
    end
    if NavEnableGamepad then
        imgui.configFlagEnable(imgui.ConfigFlags.NavEnableGamepad)
    end
    started = false
end

function M.pause()
    if not started then
        return
    end
    if paused then
        return
    end
    if FrameFunc ~= fvoid then
        M._FrameFunc = FrameFunc
    end
    _G[_FrameFunc] = fvoid

    paused = true
end

function M.resume()
    if not started then
        return
    end
    if not paused then
        return
    end
    if M._FrameFunc then
        _G[_FrameFunc] = M._FrameFunc
    end
    if M._RenderFunc then
        _G[_RenderFunc] = M._RenderFunc
    end

    paused = false
end

function M.addTask(f, priority, tag)
    M._ed:addListener('update', f, priority, tag)
end

function M._defineSpellStage()
    stage.group.New('menu', {}, "SC Debugger",
                    { lifeleft = 7, power = 400, faith = 50000, bomb = 2 }, false)
    stage.group.AddStage('SC Debugger', 'SC Debugger@SC Debugger',
                         { lifeleft = 7, power = 400, faith = 50000, bomb = 2 }, false)
    stage.group.DefStageFunc('SC Debugger@SC Debugger', 'init', function(self)
        _init_item(self)
        New(mask_fader, 'open')
        New(_G[lstg.var.player_name])
        task.New(self, function()
            do
                LoadMusic('spellcard', music_list.spellcard[1], music_list.spellcard[2], music_list.spellcard[3])
                New(bamboo_background)
            end
            task._Wait(60)
            _play_music("spellcard")
            local _boss_wait = true
            local _ref = New(_editor_class[_boss_class_name], _editor_class[_boss_class_name].cards)
            --local _ref = New(_editor_class[_boss_class_name], _debug_cards)
            last = _ref
            if _boss_wait then
                while IsValid(_ref) do
                    task.Wait()
                end
            end
            task._Wait(180)
        end)
        task.New(self, function()
            while coroutine.status(self.task[1]) ~= 'dead' do
                task.Wait()
            end
            print('task 2 start')
            _stop_music()
            --task.Wait(30)
            stage.group.FinishStage()
        end)
    end)
end

return M
