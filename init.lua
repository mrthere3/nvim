require('profile')  -- 基础配置
require('packinit') -- 插件配置
require('keymap')   -- 按键配置
local G = require('G')
-- G.cmd("colorscheme oceanic_material")
-- G.cmd([[colorscheme nord]])
G.cmd("colorscheme tokyonight-storm")
-- G.cmd([[highlight Normal ctermbg=NONE]])
-- G.cmd([[highlight Normal guibg=NONE]])
-- -- G.background = "light"
-- G.o.guifontwide = 'YourChosenFont:h10'  -- 替换为你选择的字体名称和大小
-- G.g.python3_host_prog = '/usr/bin/python3'
-- 这是neovide的配置
if G.fn.exists("g:neovide") == 1 then                 -- Put anything you want to happen only in Neovide here
    G.o.guifont = "CodeNewRoman Nerd Font Mono:h22"     -- text below applies for VimScript
    G.api.nvim_set_var( "neovide_refresh_rate", 60)
    local alpha = function()
        return string.format("%x", math.floor(255 * G.g.transparency or 0.8))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    G.g.neovide_transparency = 0.0
    G.g.transparency = 0.8
    G.g.neovide_background_color = "#0f1117" .. alpha()
end
