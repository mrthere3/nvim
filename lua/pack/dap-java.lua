-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local M ={}

function M.config()
    local config = {
      cmd = {
--         'java', '/usr/bin/java',-- or '/path/to/java17_or_newer/bin/java'
                -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--         '-jar', '/home/wxg/.config/coc/extensions/coc-java-data/server/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar',
             -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
             -- Must point to the                                                     Change this to
             -- eclipse.jdt.ls installation                                           the actual version


        -- 💀
--         '-configuration', '/home/wxg/.config/coc/extensions/coc-java-data/server/config_linux',
                        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                        -- Must point to the                      Change to one of `linux`, `win` or `mac`
                        -- eclipse.jdt.ls installation            Depending on your system.


        -- 💀
        -- See `data directory configuration` section in the README
--         '-data', "${file}"
      },

      settings = {

      },
      init_options = {
        bundles = {"/home/wxg/debug-java/com.microsoft.java.debug.plugin-0.43.0.jar"}
      },
    }
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    require('jdtls').start_or_attach(config)
end
function M.setup()
    -- do nothing
end

return M