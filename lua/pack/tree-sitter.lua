local G = require('G')
local M = {}

function M.config()
    G.hi({
        ["@variable"] = {fg="NONE"};
        ["@function"] = {fg=32};
        ["@function.call"] = {fg=32};
        ["@operator"] = {fg=166};
        ["@keyword.operator"] = {fg=166};

        ["@property"] = {fg=172};
        ["@field"]= {fg=150};
        ["@method"] = {fg=166};
        ["@method.call"] = {fg=9};
        ["@parameter"] = {fg=9};

        ["@keyword"] = {fg=1};
        ["@keyword.function"] = {fg=32};
        ["@exception"] = {fg=32};

        ["@statement"] = {fg=166};
        ["@special"] = {fg=172};
        ["@comment"]= {fg=71,sp='italic'};
        ["@include"] = {fg=1};
        ["@type"] = {fg=179};
        ["@type.builtin"] = {fg=150};
        ["@punctuation.bracket"] = {fg=151};

        ["@constructor"] = {fg=172};
        ["@namespace"] = {fg=172};

        ["@string"] = {fg=37};
        ["@number"] = {fg=37};
        ["@boolean"] = {fg=37};

        ["@tag"] = {fg=172};

        ["@text.literal"] = {fg=7};

        ["@text.todo.unchecked"] = {fg=172};
        ["@text.todo.checked"] = {fg=37};
    })
    G.map({ { 'n', 'H', ':TSHighlightCapturesUnderCursor<CR>', {silent = true, noremap = true}} })
end

function M.setup()
    require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        ignore_install = { "swift", "phpdoc","racket","qmldir","tlaplus","php","fusion","blueprint","jsonc","haskell","ruby","regex"},
        highlight = {
            enable = true
        },
      --[[
           rainbow = {
         enable = true,
         -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
         extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
         max_file_lines = nil, -- Do not enable for files with more than n lines, int
         -- colors = {}, -- table of hex strings
         -- termcolors = {} -- table of colour name strings
       }
      --]]
    }

    -- some custom highlights
    G.cmd('match Todo /TODO\\(:.*\\)*/')
end

return M
