local G = require("G")
local M ={}
function M.config()
   G.opt.termguicolors = true
    require("bufferline").setup {
        options = {
            -- 使用 nvim 内置lsp
            -- diagnostics = "coc",
            -- 左侧让出 nvim-tree 的位置
            offsets = {{
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }}
        }
    }
end

function M.setup()

end

return M
