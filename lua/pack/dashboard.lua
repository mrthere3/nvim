local M = {}
function M.config()
require('dashboard').setup{}
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝ ██╔══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗   ██████╔╝ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝   ██╔══██╗ ██║   ██║ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗ ██║  ██║ ╚██████╔╝ ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═╝  ╚═╝  ╚═════╝  ╚═╝ ╚═╝     ╚═╝',
}
vim.g.dashboard_custom_section = {
a = {description = {'  Find File                 '}, command = 'Telescope find_files'},
b = {description = {'  Recents                   '}, command = 'Telescope oldfiles'},
c = {description = {'  Load Last Session         '}, command = 'SessionLoad'},
d = {description = {'  Find Word                 '}, command = 'Telescope live_grep'},
e = {description = {'  Configuration             '}, command = ':e ~/.config/nvim/init.lua'},
f = {description = {'  Marks                     '}, command = 'Telescope marks'},
}
vim.g.dashboard_custom_footer = {'LunarVim rocks!'}
end
function M.setup()
    -- do nothing
end
return M