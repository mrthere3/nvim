require('profile')  -- 基础配置
require('packinit') -- 插件配置
require('keymap')   -- 按键配置
local G = require('G')
-- G.cmd("colorscheme oceanic_material")
-- G.cmd([[colorscheme nord]])
G.cmd("colorscheme tokyonight-storm")
G.g.python3_host_prog = '/usr/bin/python3'
G.g.python_host_prog = '/usr/bin/python3'
G.g.loaded_node_provider = '/usr/bin/node'
