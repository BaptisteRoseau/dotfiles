return {
	"ldelossa/nvim-ide",
	dependencies = {
		"akinsho/bufferline.nvim",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- Bufferline
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "filetree",
						text = "",
						highlight = "Explorer",
						text_align = "left",
					},
				},
			},
		})

		-- Debugger
		-- Closing and cleaning open panels before setting up nvim-dap-ui
		require("dapui").setup()
		local function close_nvim_ide_panels()
			if pcall(require, "ide") then
				local ws =
					require("ide.workspaces.workspace_registry").get_workspace(vim.api.nvim_get_current_tabpage())
				if ws ~= nil then
					ws.close_panel(require("ide.panels.panel").PANEL_POS_BOTTOM)
					ws.close_panel(require("ide.panels.panel").PANEL_POS_LEFT)
					ws.close_panel(require("ide.panels.panel").PANEL_POS_RIGHT)
				end
			end
		end

		local dapui_open = function()
			require("dapui").open()
			close_nvim_ide_panels()
		end

		-- Adviced from nvim-dap-ui to automatically open/close
		-- during debugging session
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui_open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui_open()
		end
		dap.listeners.after.event_initialized.dapui_config = function()
			dapui_open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- default components
		local explorer = require("ide.components.explorer")
		local outline = require("ide.components.outline")
		local callhierarchy = require("ide.components.callhierarchy")
		local timeline = require("ide.components.timeline")
		local terminal = require("ide.components.terminal")
		local changes = require("ide.components.changes")
		local commits = require("ide.components.commits")
		local branches = require("ide.components.branches")

		require("ide").setup({
			-- values: "nerd", "codicon", "default"
			icon_set = "default",
			-- Set the log level for nvim-ide's log. Log can be accessed with
			-- 'Workspace OpenLog'. Values are 'debug', 'warn', 'info', 'error'
			log_level = "info",
			-- Component specific configurations and default config overrides.
			components = {
				-- The global keymap is applied to all Components before construction.
				-- It allows common keymaps such as "hide" to be overridden, without having
				-- to make an override entry for all Components.
				--
				-- If a more specific keymap override is defined for a specific Component
				-- this takes precedence.
				global_keymaps = {
					-- example, change all Component's hide keymap to "h"
					-- hide = h
				},
				-- example, prefer "x" for hide only for Explorer component.
				-- Explorer = {
				--     keymaps = {
				--         hide = "x",
				--     }
				-- }
			},
			-- default panel groups to display on left and right.
			panels = {
				left = "explorer",
				right = "git",
			},
			-- panels defined by groups of components, user is free to redefine the defaults
			-- and/or add additional.
			panel_groups = {
				explorer = {
					explorer.Name,
					outline.Name,
					callhierarchy.Name,
				},
				terminal = { terminal.Name },
				git = { changes.Name, commits.Name, timeline.Name, branches.Name },
			},
			-- workspaces config
			workspaces = {
				-- which panels to open by default, one of: 'left', 'right', 'both', 'none'
				auto_open = "left",
			},
			-- default panel sizes for the different positions
			panel_sizes = {
				left = 30,
				right = 30,
				bottom = 15,
			},
		})

		-- Keymap
		local keymap = vim.keymap
		keymap.set("n", "<leader>il", "<cmd>Workspace LeftPanelToggle<cr>", { desc = "[I]DE toggle [L]eft panel" })
		keymap.set("n", "<leader>ir", "<cmd>Workspace RightPanelToggle<cr>", { desc = "[I]DE toggle [R]ight panel" })
		keymap.set("n", "<leader>id", dapui_open, { desc = "[I]DE open [D]ebug Interface" })

		require("which-key").register({
			["<leader>i"] = { name = "[I]DE", _ = "which_key_ignore" },
		})
	end,
}
