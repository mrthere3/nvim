local dap_install = require "dap-install"
local M={}
function M.config()
    dap_install.config(
        "python",
      {})
    dap_install.setup {
    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
    }
end
function M.setup()
    -- do nothing
end

return M