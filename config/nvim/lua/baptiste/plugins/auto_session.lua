return {
	"rmagatti/auto-session",
	-- TODO: Auto save session on InsertEvent
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = {
				"~CodinGame",
				"~Games",
				"~Pictures",
				"~snap",
				"~VirtualBoxVMs",
				"~Desktop",
				"~GitLabServer",
				"~Projects",
				"~Templates",
				"~vmware",
				"~Documents",
				"~ISOs",
				"~Public",
				"~TestLlama2Coder7b",
				"~Downloads",
				"~Music",
				"~SharedFolders",
				"~Videos",
				"~/",
				"/",
				"/tmp",
			},
			auto_save_enabled = true,
			auto_restore_enabled = true,
		})
	end,
}
