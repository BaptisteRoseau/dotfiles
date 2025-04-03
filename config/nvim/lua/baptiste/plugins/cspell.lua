-- TODO: Add "disable for workspace" option
return {
    "davidmh/cspell.nvim",
    opts = {},
    dependencies = {
        "nvimtools/none-ls.nvim",
    },
    config = function()
        local cspell = require("cspell")
        local config = {
            config_file_preferred_name = ".cspell.json",
            on_add_to_json = function(payload)
                -- Format json as human readable
                os.execute(
                    string.format(
                        "command -v jq &>/dev/null && (jq -S '.words |= sort' %s > %s.tmp && mv -f %s.tmp %s)",
                        payload.cspell_config_path,
                        payload.cspell_config_path,
                        payload.cspell_config_path,
                        payload.cspell_config_path
                    )
                )
            end,
        }
        require("null-ls").setup({
            sources = {
                cspell.diagnostics.with({ config = config }),
                cspell.code_actions.with({ config = config }),
            },
        })
    end,
}
