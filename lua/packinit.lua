local G = require('G')
local packer_bootstrap = false
local install_path = G.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compiled_path = G.fn.stdpath('config')..'/plugin/packer_compiled.lua'
if G.fn.empty(G.fn.glob(install_path)) > 0 then
    print('Installing packer.nvim...')
    G.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    G.fn.system({'rm', '-rf', compiled_path})
    G.cmd [[packadd packer.nvim]]
    packer_bootstrap = true
end

-- 所有插件配置分 config 和 setup 部分
-- config 发生在插件载入前 一般为 let g:xxx = xxx 或者 hi xxx xxx 或者 map x xxx 之类的 配置
-- setup  发生在插件载入后 一般为 require('xxx').setup() 之类的配置
require('packer').startup({
    function(use)
        -- theme--
        use{'arcticicestudio/nord-vim'}
        use{'glepnir/oceanic-material'}
        -- require('pack/colorscheme').config()
        -- packer 管理自己的版本
        use { 'wbthomason/packer.nvim' }
        -- 启动时间分析
        use { "dstein64/vim-startuptime", cmd = "StartupTime" }

        -- 中文help doc
        use { 'yianwillis/vimcdoc', event = 'VimEnter' }

        -- vv 快速选中内容插件
        require('pack/vim-expand-region').config()
        use { 'terryma/vim-expand-region', config = "require('pack/vim-expand-region').setup()", event = 'CursorHold' }
        -- ff 高亮光标下的word
        require('pack/vim-interestingwords').config()
        use { 'lfv89/vim-interestingwords', config = "require('pack/vim-interestingwords').setup()", event = 'CursorHold' }

        -- 多光标插件
        require('pack/vim-visual-multi').config()
        use { 'mg979/vim-visual-multi', config = "require('pack/vim-visual-multi').setup()", event = 'CursorHold' }

        -- 数据库可视化UI
        require('pack/vim-dadbod').config()
        use { 'tpope/vim-dadbod', cmd = "DBUI" }
        use { 'kristijanhusak/vim-dadbod-ui', config = "require('pack/vim-dadbod').setup()", after = 'vim-dadbod' }

        -- coc-nvim
        require('pack/coc').config()
        use { 'neoclide/coc.nvim', config = "require('pack/coc').setup()", branch = 'release' }

        -- github copilot
        require('pack/copilot').config()
        use { 'github/copilot.vim', config = "require('pack/copilot').setup()", event = 'InsertEnter' }

        -- 浮动终端
        require('pack/vim-floaterm').config()
        use { 'voldikss/vim-floaterm', config = "require('pack/vim-floaterm').setup()" }

        -- fzf
        require('pack/fzf').config()
        use { 'junegunn/fzf' }
        use { 'junegunn/fzf.vim', config = "require('pack/fzf').setup()", run = 'cd ~/.fzf && ./install --all', after = "fzf" }

        -- tree-sitter
        require('pack/tree-sitter').config()
        use { 'nvim-treesitter/nvim-treesitter', config = "require('pack/tree-sitter').setup()", run = ':TSUpdate', event = 'BufRead' }
        -- use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

        -- markdown预览插件 导航生成插件
        require('pack/markdown').config()
        use { 'mzlogin/vim-markdown-toc', ft = 'markdown' }
        use { 'iamcco/markdown-preview.nvim', config = "require('pack/markdown').setup()", run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = 'markdown' }

        -- 文件管理器
        require('pack/nvim-tree').config()
        use { 'kyazdani42/nvim-tree.lua', config = "require('pack/nvim-tree').setup()", cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' } }

        -- 状态栏 & 标题栏
        require('pack/nvim-lines').config()
        use { 'yaocccc/nvim-lines.lua', config = "require('pack/nvim-lines').setup()" }
--         use {'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
--         require('pack/lualine').config()


        -- 部分个人自写插件
        require('pack/yaocccc').config()                                               -- yaocccc/* 共用一个config
        use { 'yaocccc/vim-comment' }                                                  -- 注释插件
        use { 'yaocccc/vim-echo', cmd = "VECHO" }                                      -- 快速echo、print
        use { 'yaocccc/vim-fcitx2en', event = 'InsertLeavePre' }                       -- 退出输入模式时自动切换到英文
        use { 'yaocccc/nvim-hlchunk' }                                                 -- 高亮{}范围
        use { 'yaocccc/vim-surround' }                                                 -- 操作成对的 ""  {}  [] 等的插件
        use { 'yaocccc/vim-showmarks' }                                                -- 显示mark在signcolumn
                -- debug--
--         use {"ravenxrz/nvim-dap",}
--         use {"rcarriga/nvim-dap-ui"}
--         require('pack/dap-config').config()
--         require('pack/dap-config').setup()
--         use {"theHamsta/nvim-dap-virtual-text"}
--         require('pack/dap-vutext').config()
--         require('pack/dap-ui').config()
-- --         use {"ravenxrz/DAPInstall.nvim",config = require('pack/dap-config').setup()}
--         use {'leoluz/nvim-dap-go'}


    end,
    config = {
        git = { clone_timeout = 120, depth = 1 },
        display = {
            working_sym = '[ ]', error_sym = '[✗]', done_sym = '[✓]', removed_sym = ' - ', moved_sym = ' → ', header_sym = '─',
            open_fn = function() return require("packer.util").float({ border = "rounded" }) end
        }
    }
})

if packer_bootstrap then
    require('packer').sync()
end
