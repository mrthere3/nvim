local M ={}
function M.config()
    
local db = require("dashboard")
 db.setup({
  theme = 'doom',
  config = {
    header = {
  [[              ▄▄▄▄▄▄▄▄▄            ]],
  [[           ▄█████████████▄          ]],
  [[   █████  █████████████████  █████  ]],
  [[   ▐████▌ ▀███▄       ▄███▀ ▐████▌  ]],
  [[    █████▄  ▀███▄   ▄███▀  ▄█████    ]],
  [[    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ]],
  [[     ███▄▀███▄  ▀███▀  ▄███▀▄███    ]],
  [[     ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌    ]],
  [[      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ]],
  [[       ▀███▄▀██ █████ ██▀▄███▀      ]],
  [[      █▄ ▀█████ █████ █████▀ ▄█      ]],
  [[      ███        ███        ███      ]],
  [[      ███▄    ▄█ ███ █▄    ▄███      ]],
  [[      █████ ▄███ ███ ███▄ █████      ]],
  [[      █████ ████ ███ ████ █████      ]],
  [[      █████ ████▄▄▄▄▄████ █████      ]],
  [[       ▀███ █████████████ ███▀      ]],
  [[         ▀█ ███ ▄▄▄▄▄ ███ █▀        ]],
  [[            ▀█▌▐█████▌▐█▀            ]],
  [[               ███████              ]]
}, --your header
    center = {
    {
        icon = ' ',
        desc = 'Recently lastest session',
        key = 'e',
        keymap = 'SPC f e',
        action = 'source C:/Users/wxg/AppData/Local/nvim/nvim/cache/Session.vim',
      },
        {
        icon = '',
        desc = ' Recently opened files ',
        key = 'f',
        keymap = 'SPC f d',
        action = 'Telescope oldfiles',
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope find_files',
      },
        {
        icon = '',
        desc = 'Search Text',
        key = 's',
        keymap = 'SPC f s',
        action = 'Telescope live_grep',
      },
    },
    footer = {'Do one thing, do it well - Unix Philosophy'}  --your footer
  }
})
end

return M
