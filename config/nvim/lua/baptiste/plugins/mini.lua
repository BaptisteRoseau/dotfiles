local build = function(plugin_name)
    return {
        "echasnovski/" .. plugin_name,
        version = "*",
        config = function()
            require(plugin_name).setup()
        end,
    }
end

-- See https://github.com/echasnovski/mini.nvim
return {
    build("mini.align"),
    build("mini.comment"),
    build("mini.cursorword"),
    build("mini.jump"),
}
