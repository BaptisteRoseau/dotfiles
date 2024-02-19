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
			auto_session_enabled = true,
			auto_restore_enabled = true,
			auto_session_enable_last_session = true,
			auto_session_use_git_branch = false,
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
		})
	end,
}