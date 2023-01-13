local dap = require('dap')
local M ={}

function M.config()
    dap.configurations.java = {
      {
         -- You need to extend the classPath to list your dependencies.
         -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
--         classPaths = {},

        -- If using multi-module projects, remove otherwise.
        projectName = "Launch file",

        javaExec = "/usr/lib/jvm/java-11-openjdk-amd64/bin/java",
--         mainClass = "your.package.name.MainClassName",

        -- If using the JDK9+ module system, this needs to be extended
        -- `nvim-jdtls` would automatically populate this property
        modulePaths = {},
        name = "Launch YourClassName",
        request = "launch",
        type = "java",
      },
    }

    dap.adapters.python = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    }

    dap.adapters.java = function(callback)
      -- FIXME:
      -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
      -- The response to the command must be the `port` used below
      callback({
        type = 'server';
        host = '127.0.0.1';
        port = 8432;
      })
    end

    dap.configurations.python = {
      -- launch exe
      {
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",
        program = "${file}", -- This configuration will launch the current file if used.
        args = function()
          local input = vim.fn.input("Input args: ")
          return require("dap.dap-util").str2argtable(input)
        end,
        pythonPath = '/usr/bin/python3.8'
      }
    }

  local dap_breakpoint = {
    error = {
      text = "🛑",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "⭐️",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end
local function config_dapui()
  local dap, dapui = require "dap", require "dapui"

  local debug_open = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
--     vim.api.nvim_command("NvimTreeClose")
  end
  local debug_close = function()
    dap.repl.close()
    dapui.close()
    vim.api.nvim_command("DapVirtualTextDisable")
    -- vim.api.nvim_command("bdelete! term:")   -- close debug temrinal
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    debug_open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    debug_close()
  end
  dap.listeners.before.event_exited["dapui_config"]     = function()
    debug_close()
  end
  dap.listeners.before.disconnect["dapui_config"]       = function()
    debug_close()
  end
end

function M.setup()
    config_dapui()
    -- do nothing
end

return M