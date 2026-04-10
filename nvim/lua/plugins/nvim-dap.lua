return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>db", desc = "DAP Toggle breakpoint" },
			{ "<leader>dc", desc = "DAP Continue" },
			{ "<leader>di", desc = "DAP Step into" },
			{ "<leader>do", desc = "DAP Step over" },
			{ "<leader>dO", desc = "DAP Step out" },
			{ "<leader>dt", desc = "DAP Terminate" },
			{ "<leader>dr", desc = "DAP Open REPL" },
			{ "<leader>dl", desc = "DAP Run last" },
			{ "<leader>du", desc = "DAP Toggle UI" },
		},
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio", -- required by nvim-dap-ui
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Mason DAP adapter installation (adapters defined in lang files)
			require("mason-nvim-dap").setup({
				ensure_installed = require("lang").mason_dap(),
				automatic_installation = true,
				handlers = {}, -- disable automatic configuration; lang files do this manually
			})

			dapui.setup()

			-- Auto open/close UI on session start/end
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Language-specific adapter and configuration setup
			require("lang").apply_dap_configs(dap, dapui)

			local map = vim.keymap.set
			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle breakpoint" })
			map("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
			map("n", "<leader>di", dap.step_into, { desc = "DAP Step into" })
			map("n", "<leader>do", dap.step_over, { desc = "DAP Step over" })
			map("n", "<leader>dO", dap.step_out, { desc = "DAP Step out" })
			map("n", "<leader>dt", dap.terminate, { desc = "DAP Terminate" })
			map("n", "<leader>dr", dap.repl.open, { desc = "DAP Open REPL" })
			map("n", "<leader>dl", dap.run_last, { desc = "DAP Run last" })
			map("n", "<leader>du", dapui.toggle, { desc = "DAP Toggle UI" })
		end,
	},
}
