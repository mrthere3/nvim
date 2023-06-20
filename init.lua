require('profile')  -- 基础配置
require('packinit') -- 插件配置
require('keymap')   -- 按键配置
local G = require('G')
-- G.cmd("colorscheme oceanic_material")
-- G.cmd([[colorscheme nord]])
G.cmd("colorscheme tokyonight-storm")
G.cmd([[highlight Normal ctermbg=NONE]])
G.cmd([[highlight Normal guibg=NONE]])
-- G.background = "light"
-- G.o.guifontwide = 'YourChosenFont:h10'  -- 替换为你选择的字体名称和大小


-- G.g.python3_host_prog = '/usr/bin/python3'
-- G.g.python_host_prog = '/usr/bin/python3'
-- G.g.loaded_node_provider = '/usr/bin/node'
-- 背景透明设置
-- if vim.fn.has('win32') or vim.fn.has('win64') then
--     vim.o.background = 'dark'  -- 设置为'light'以使用浅色背景
--     vim.cmd('set termguicolors')
--     vim.cmd('hi Normal  ctermfg=252 ctermbg=none')
-- end
-- hi Normal  ctermfg=252 ctermbg=none

