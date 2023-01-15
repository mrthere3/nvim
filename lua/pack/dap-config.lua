local dap = require('dap')
local M ={}

function M.config()
--     dap.configurations.java = {
--       {
--          -- You need to extend the classPath to list your dependencies.
--          -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
-- --         classPaths = {},
--
--         -- If using multi-module projects, remove otherwise.
--         projectName = "Launch file",
--
--         javaExec = "/usr/lib/jvm/java-11-openjdk-amd64/bin/java",
-- --         mainClass = "your.package.name.MainClassName",
--
--         -- If using the JDK9+ module system, this needs to be extended
--         -- `nvim-jdtls` would automatically populate this property
--         modulePaths = {},
--         name = "Launch YourClassName",
--         request = "launch",
--         type = "java",
--       },
--     }

    dap.adapters.python = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    }

--     dap.adapters.java = function(callback)
--       -- FIXME:
--       -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
--       -- The response to the command must be the `port` used below
--       callback({
--         type = 'server';
--         host = '127.0.0.1';
--         port = 8432;
--       })
--     end
    dap.adapters.node2 = {
      type = 'executable',
      command = 'node',
      args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
    }
    dap.configurations.javascript = {
      {
        name = "Launch file",
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = 'inspector',
--         console = 'integratedTerminal',
      },
--       {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--         name = 'Attach to process',
--         type = 'node2',
--         request = 'attach',
--         processId = require'dap.utils'.pick_process,
--       },
    }
    dap.configurations.python = {
      -- launch exe
      {
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",
        program = "${file}", -- This configuration will launch the current file if used.
        args = function()
          local input = vim.fn.input("Input args: ")
          return require("pack.dap-util").str2argtable(input)
        end,
        pythonPath = '/usr/bin/python3.8'
      }
    }
    dap.adapters.go = function(callback, config)
      local stdout = vim.loop.new_pipe(false)
      local handle
      local pid_or_err
      local port = 38697
      local opts = {
        stdio = { nil, stdout },
        args = { "dap", "--check-go-version=false", "--listen=127.0.0.1:" .. port, "--log-dest=3" },
        detached = true
      }
      handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
        stdout:close()
        handle:close()
        if code ~= 0 then
          print('dlv exited with code', code)
        end
      end)
      assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
      stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
          vim.schedule(function()
            require('dap.repl').append(chunk)
          end)
        end
      end)
      -- Wait for delve to start
      vim.defer_fn(
        function()
          callback({type = "server", host = "127.0.0.1", port = port})
        end,
        300)
    end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        cwd = '${workspaceFolder}',
        program = "${file}",
--         args = function()
--           local input = vim.fn.input("Input args: ")
--           return require("pack.dap-util").str2argtable(input)
--         end,
      },
--       {
--         type = "go",
--         name = "Debug test", -- configuration for debugging test files
--         request = "launch",
--         mode = "test",
-- --         cwd = '${workspaceFolder}',
--         program = "${file}"
--       },
--       -- works with go.mod packages and sub packages
--       {
--         type = "go",
--         name = "Debug test (go.mod)",
--         request = "launch",
--         mode = "test",
--         cwd = '${workspaceFolder}',
--         program = "./${relativeFileDirname}"
--       },
    }
--    dap.configurations.java = {
--     {
--       type = 'java';
--       request = 'attach';
--       name = "Attach to the process";
--       hostName = 'localhost';
--       port = '5005';
--     }}

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
