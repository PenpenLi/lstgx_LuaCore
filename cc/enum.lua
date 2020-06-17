--
local M = {}

local ProgramType = {}
M.ProgramType = ProgramType

ProgramType.POSITION_COLOR_LENGTH_TEXTURE = 0         -- positionColorLengthTexture_vert, positionColorLengthTexture_frag
ProgramType.POSITION_COLOR_TEXTURE_AS_POINTSIZE = 1   -- positionColorTextureAsPointsize_vert, positionColor_frag
ProgramType.POSITION_COLOR = 2                        -- positionColor_vert,           positionColor_frag
ProgramType.POSITION = 3                              -- position_vert,                positionColor_frag
ProgramType.POSITION_UCOLOR = 4                       -- positionUColor_vert,          positionUColor_frag
ProgramType.POSITION_TEXTURE = 5                      -- positionTexture_vert,         positionTexture_frag
ProgramType.POSITION_TEXTURE_COLOR = 6                -- positionTextureColor_vert,    positionTextureColor_frag
ProgramType.POSITION_TEXTURE_COLOR_ALPHA_TEST = 7     -- positionTextureColor_vert,    positionTextureColorAlphaTest_frag
ProgramType.LABEL_NORMAL = 8                          -- positionTextureColor_vert,    label_normal_frag
ProgramType.LABLE_OUTLINE = 9                         -- positionTextureColor_vert,    labelOutline_frag
ProgramType.LABLE_DISTANCEFIELD_GLOW = 10             -- positionTextureColor_vert,    labelDistanceFieldGlow_frag
ProgramType.LABEL_DISTANCE_NORMAL = 11                -- positionTextureColor_vert,    label_distanceNormal_frag
ProgramType.LAYER_RADIA_GRADIENT = 12                 -- position_vert,                layer_radialGradient_frag
ProgramType.ETC1 = 13                                 -- positionTextureColor_vert,    etc1_frag
ProgramType.ETC1_GRAY = 14                            -- positionTextureColor_vert,    etc1Gray_frag
ProgramType.GRAY_SCALE = 15                           -- positionTextureColor_vert,    grayScale_frag
ProgramType.CAMERA_CLEAR = 16                         -- cameraClear_vert,             cameraClear_frag
ProgramType.TERRAIN_3D = 17                           -- CC3D_terrain_vert,                    CC3D_terrain_frag
ProgramType.LINE_COLOR_3D = 18                        -- lineColor3D_vert,                     lineColor3D_frag
ProgramType.SKYBOX_3D = 19                            -- CC3D_skybox_vert,                     CC3D_skybox_frag
ProgramType.SKINPOSITION_TEXTURE_3D = 20              -- CC3D_skinPositionTexture_vert,        CC3D_colorTexture_frag
ProgramType.SKINPOSITION_NORMAL_TEXTURE_3D = 21       -- CC3D_skinPositionNormalTexture_vert,  CC3D_colorNormalTexture_frag
ProgramType.POSITION_NORMAL_TEXTURE_3D = 22           -- CC3D_positionNormalTexture_vert,      CC3D_colorNormalTexture_frag
ProgramType.POSITION_NORMAL_3D = 23                   -- CC3D_positionNormalTexture_vert,      CC3D_colorNormal_frag
ProgramType.POSITION_TEXTURE_3D = 24                  -- CC3D_positionTexture_vert,            CC3D_colorTexture_frag
ProgramType.POSITION_3D = 25                          -- CC3D_positionTexture_vert,            CC3D_color_frag
ProgramType.POSITION_BUMPEDNORMAL_TEXTURE_3D = 26     -- CC3D_positionNormalTexture_vert,      CC3D_colorNormalTexture_frag
ProgramType.SKINPOSITION_BUMPEDNORMAL_TEXTURE_3D = 27 -- CC3D_skinPositionNormalTexture_vert,  CC3D_colorNormalTexture_frag
ProgramType.PARTICLE_TEXTURE_3D = 28                  -- CC3D_particle_vert,                   CC3D_particleTexture_frag
ProgramType.PARTICLE_COLOR_3D = 29                    -- CC3D_particle_vert,                   CC3D_particleColor_frag
ProgramType.CUSTOM_PROGRAM = 30                       -- user-define program


return M