local G = require('G')
local M = {}

function M.config()
    -- G.g.mkdp_browser = 'wyeb'
    G.g.mkdp_markdown_css = '/home/chenyc/.config/nvim/colors/markdown.css'
    G.g.mkdp_page_title = '${name}'
    G.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
    G.g.mkdp_theme = 'dark'
    G.g.vmt_fence_text = 'markdown-toc'
end

function M.setup()
    -- do nothing
end

return M
