local M = {
    --{
    --    label   = 'File',
    --    name    = "PanelFile",
    --    content = {
    --        { name   = "ToolNew",
    --          bitmap = 'toolbar/new.png',
    --        },
    --        { name   = "ToolOpen",
    --          bitmap = 'toolbar/open.png',
    --        },
    --        { name   = "ToolSave",
    --          bitmap = 'toolbar/save.png',
    --        },
    --        { name   = "ToolClose",
    --          bitmap = 'toolbar/delete.png',
    --        },
    --        { name   = "ToolMerge",
    --          bitmap = 'toolbar/merge.png',
    --        },
    --    },
    --},
    {
        label   = 'General',
        name    = "PanelGeneral",
        content = {
            { name   = "folder",
              bitmap = 'folder.png',
            },
            { name   = "codeblock",
              bitmap = 'codeblock.png',
            },
            { name   = "if",
              bitmap = 'if.png',
            },
            { name   = "variable",
              bitmap = 'variable.png',
            },
            { name   = "repeat",
              bitmap = 'repeat.png',
            },
            { name   = "code",
              bitmap = 'code.png',
            },
            { name   = "comment",
              bitmap = 'comment.png',
            },
            { name   = "patch",
              bitmap = 'patch.png',
            },
            
            { name   = "x_repeat", },
            { name   = "x_repeat_var", },
            { name   = "x_repeat_var_inc", },
        },
    },
    {
        label   = 'Stage',
        name    = "PanelStage",
        content = {
            { name   = "stagegroup",
              bitmap = 'stagegroup.png',
            },
            { name   = "stage",
              bitmap = 'stage.png',
            },
            { name   = "stagegoto",
              bitmap = 'stagegoto.png',
            },
            { name   = "stagefinish",
              bitmap = 'stagefinish.png',
            },
            { name   = "stagefinishgroup",
              bitmap = 'stagefinishgroup.png',
            },
            { name   = "bgstage",
              bitmap = 'bgstage.png',
            },
        },
    },
    {
        label   = 'Task',
        name    = "PanelTask",
        content = {
            { name   = "task",
              bitmap = 'task.png',
            },
            { name   = "tasker",
              bitmap = 'tasker.png',
            },
            { name   = "taskwait",
              bitmap = 'taskwait.png',
            },
            --[[
            { name   = "taskrepeat",
              bitmap = 'taskrepeat.png',
            },
            { name   = "taskbreak",
              bitmap = 'taskbreak.png',
            },
            --]]
            { name   = "taskmoveto",
              bitmap = 'taskmoveto.png',
            },
            { name   = "taskBeziermoveto",
              bitmap = 'taskBeziermoveto.png',
            },
            { name   = "taskreturn",
              bitmap = 'taskreturn.png',
            },
            { name   = "taskclear",
              bitmap = 'taskclear.png',
            },
        },
    },
    {
        label   = 'Enemy',
        name    = "PanelEnemy",
        content = {
            { name   = "enemydefine",
              bitmap = 'enemydefine.png',
            },
            { name   = "enemycreate",
              bitmap = 'enemycreate.png',
            },
            { name   = "enemysimple",
              bitmap = 'enemysimple.png',
            },
        },
    },
    {
        label   = 'Boss',
        name    = "PanelBoss",
        content = {
            { name   = "bossdefine",
              bitmap = 'bossdefine.png',
            },
            { name   = "bossspellcard",
              bitmap = 'bossspellcard.png',
            },
            { name   = "bossmoveto",
              bitmap = 'bossmoveto.png',
            },
            { name   = "dialog",
              bitmap = 'dialog.png',
            },
            { name   = "sentence",
              bitmap = 'sentence.png',
            },
            { name   = "taskbosswander",
              bitmap = 'taskbosswander.png',
            },
            { name   = "bosscast",
              bitmap = 'bosscast.png',
            },
            { name   = "bossshowaura",
              bitmap = 'bossshowaura.png',
            },
            { name   = "pactrometer",
              bitmap = 'pactrometer.png',
            },
            { name   = "explode",
              bitmap = 'explode.png',
            },
            { name   = "bosscreate",
              bitmap = 'bosscreate.png',
            },
            { name   = "bgdefine",
              bitmap = 'bgdefine.png',
            },
            { name   = "bglayer",
              bitmap = 'bglayer.png',
            },
        },
    },
    {
        label   = 'Bullet',
        name    = "PanelBullet",
        content = {
            { name   = "bulletdefine",
              bitmap = 'bulletdefine.png',
            },
            { name   = "bulletcreate",
              bitmap = 'bulletcreate.png',
            },
            { name   = "bulletchangestyle",
              bitmap = 'bulletchangestyle.png',
            },
            { name   = "bulletcreatestraight",
              bitmap = 'bulletcreatestraight.png',
            },
            { name   = "bulletcreatestraightex",
              bitmap = 'bulletcreatestraightex.png',
            },
            { name   = "bulletclear",
              bitmap = 'bulletclear.png',
            },
            { name   = "bulletcleanrange",
              bitmap = 'bulletcleanrange.png',
            },
        },
    },
    --[[
    {
        label   = 'Tools',
        name    = "PanelTools",
        content = {
            { name   = "rebounderdefine",
              bitmap = 'rebounderdefine.png',
            },
            { name   = "reboundercreate",
              bitmap = 'reboundercreate.png',
            },
            { name   = "simplerebounder",
              bitmap = 'simplerebounder.png',
            },
        },
    },
    --]]
    --[[
    {
        label   = 'BulletEx',
        name    = "PanelBulletEx",
        content = {
            { name   = "iteration",
              bitmap = 'iteration.png',
            },
            { name   = "shooter",
              bitmap = 'shooter.png',
            },
            { name   = "lasershooter",
              bitmap = 'lasershooter.png',
            },
            { name   = "bentlasershooter",
              bitmap = 'bentlasershooter.png',
            },
            { name   = "_node_atp",
              bitmap = '_node_atp.png',
            },
            { name   = "_node_g",
              bitmap = '_node_g.png',
            },
            { name   = "_node_accel",
              bitmap = '_node_accel.png',
            },
            { name   = "_node_stay",
              bitmap = '_node_stay.png',
            },
            { name   = "_node_vf",
              bitmap = '_node_vf.png',
            },
            { name   = "_node_pro",
              bitmap = '_node_pro.png',
            },
            { name   = "_node_dir",
              bitmap = '_node_dir.png',
            },
            { name   = "_node_aa",
              bitmap = '_node_aa.png',
            },
            { name   = "_node_moveto",
              bitmap = '_node_moveto.png',
            },
            { name   = "_node_rot",
              bitmap = '_node_rot.png',
            },
            { name   = "_node_pe",
              bitmap = '_node_pe.png',
            },
            { name   = "_node_toc",
              bitmap = '_node_toc.png',
            },
            { name   = "_node_tof",
              bitmap = '_node_tof.png',
            },
        },
    },
    --]]
    {
        label   = 'Laser',
        name    = "PanelLaser",
        content = {
            { name   = "laserdefine",
              bitmap = 'laserdefine.png',
            },
            { name   = "lasercreate",
              bitmap = 'lasercreate.png',
            },
            { name   = "laserturnhalfon",
              bitmap = 'laserturnhalfon.png',
            },
            { name   = "laserturnon",
              bitmap = 'laserturnon.png',
            },
            { name   = "laserturnoff",
              bitmap = 'laserturnoff.png',
            },
            { name   = "lasergrow",
              bitmap = 'lasergrow.png',
            },
            { name   = "laserchange",
              bitmap = 'laserchange.png',
            },
            { name   = "laserbentdefine",
              bitmap = 'laserbentdefine.png',
            },
            { name   = "laserbentcreate",
              bitmap = 'laserbentcreate.png',
            },
        },
    },
    {
        label   = 'Object',
        name    = "PanelObject",
        content = {
            { name   = "objectdefine",
              bitmap = 'objectdefine.png',
            },
            { name   = "objectcreate",
              bitmap = 'objectcreate.png',
            },
            { name   = "setcolor",
              bitmap = 'setcolor.png',
            },
            { name   = "objectsetimg",
              bitmap = 'objectsetimg.png',
            },
            --[[
        },
    },
    {
        label   = 'Unit',
        name    = "PanelUnit",
        content = {
            --]]
            { name   = "callbackfunc",
              bitmap = 'callbackfunc.png',
            },
            { name   = "defaultaction",
              bitmap = 'defaultaction.png',
            },
            { name   = "setv",
              bitmap = 'setv.png',
            },
            --[[
            { name   = "setaccel",
              bitmap = 'setaccel.png',
            },
            { name   = "setgravity",
              bitmap = 'setgravity.png',
            },
            { name   = "setfv",
              bitmap = 'setfv.png',
            },
            --]]
            { name   = "unitkill",
              bitmap = 'unitkill.png',
            },
            { name   = "unitdel",
              bitmap = 'unitdel.png',
            },
            { name   = "unitforeach",
              bitmap = 'unitforeach.png',
            },
            { name   = "connect",
              bitmap = 'connect.png',
            },
            { name   = "setrelpos",
              bitmap = 'setrelpos.png',
            },
        },
    },
    {
        label   = 'Audio',
        name    = "PanelAudio",
        content = {
            { name   = "loadsound",
              bitmap = 'loadsound.png',
            },
            { name   = "playsound",
              bitmap = 'playsound.png',
            },
            { name   = "loadbgm",
              bitmap = 'loadbgm.png',
            },
            { name   = "playbgm",
              bitmap = 'playbgm.png',
            },
            { name   = "pausebgm",
              bitmap = 'pausebgm.png',
            },
            { name   = "resumebgm",
              bitmap = 'resumebgm.png',
            },
            { name   = "stopbgm",
              bitmap = 'stopbgm.png',
            },
        },
    },
    {
        label   = 'Graphics',
        name    = "PanelGraphics",
        content = {
            { name   = "loadimage",
              bitmap = 'loadimage.png',
            },
            { name   = "loadani",
              bitmap = 'loadani.png',
            },
            { name   = "loadparticle",
              bitmap = 'loadparticle.png',
            },
            { name   = "loadimagegroup",
              bitmap = 'loadimagegroup.png',
            },
            { name   = "loadtexture",
              bitmap = 'loadtexture.png',
            },
            --{ name   = "renderimage",
            --  bitmap = 'renderimage.png',
            --},
        },
    },
    {
        label   = 'Effects',
        name    = "PanelEffects",
        content = {
            { name   = "shakescreen",
              bitmap = 'shakescreen.png',
            },
            { name   = "dropitem",
              bitmap = 'dropitem.png',
            },
            { name   = "loadFX",
              bitmap = 'loadFX.png',
            },
            { name   = "smear",
              bitmap = 'smear.png',
            },
        },
    },
}

return M
