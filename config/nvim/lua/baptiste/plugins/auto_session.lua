return {
	"rmagatti/auto-session",
	-- TODO: Auto save session on InsertEvent
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		})
	end,
}
