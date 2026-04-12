local M = {}

-- Add new language module names here when creating a new lang file
local lang_files = {
	"python",
	"go",
	"typescript",
	"c",
	"cpp",
	"lua_lang",
	"php",
	"html",
}

local _loaded = nil
local function load_all()
	if _loaded then
		return _loaded
	end
	_loaded = {}
	for _, name in ipairs(lang_files) do
		_loaded[name] = require("lang." .. name)
	end
	return _loaded
end

-- List of treesitter parsers to install
function M.parsers()
	local out = {}
	for _, lang in pairs(load_all()) do
		vim.list_extend(out, lang.treesitter or {})
	end
	return out
end

-- List of LSP server names for mason-lspconfig ensure_installed
function M.mason_lsp()
	local out = {}
	for _, lang in pairs(load_all()) do
		vim.list_extend(out, (lang.mason or {}).lsp or {})
	end
	return out
end

-- Deduplicated list of tool names for mason-tool-installer ensure_installed
function M.mason_tools()
	local seen = {}
	local out = {}
	for _, lang in pairs(load_all()) do
		for _, tool in ipairs((lang.mason or {}).tools or {}) do
			if not seen[tool] then
				seen[tool] = true
				table.insert(out, tool)
			end
		end
	end
	return out
end

-- Table of { config, post_attach } keyed by server name, for nvim-lspconfig
function M.lsp_servers()
	local out = {}
	for _, lang in pairs(load_all()) do
		if lang.lsp then
			out[lang.lsp.server] = {
				config = lang.lsp.config or {},
				post_attach = lang.lsp.post_attach,
			}
		end
	end
	return out
end

-- formatters_by_ft table for conform.nvim
function M.formatters_by_ft()
	local out = {}
	for _, lang in pairs(load_all()) do
		for ft, fmts in pairs((lang.formatters or {}).by_ft or {}) do
			out[ft] = fmts
		end
	end
	return out
end

-- Applies per-formatter config overrides to a conform instance
-- Config values may be a table (assigned directly) or a function(conform)
function M.apply_formatter_configs(conform)
	for _, lang in pairs(load_all()) do
		for name, cfg in pairs((lang.formatters or {}).config or {}) do
			if type(cfg) == "function" then
				cfg(conform)
			else
				conform.formatters[name] = cfg
			end
		end
	end
end

-- linters_by_ft table for nvim-lint
function M.linters_by_ft()
	local out = {}
	for _, lang in pairs(load_all()) do
		for ft, linters in pairs((lang.linters or {}).by_ft or {}) do
			out[ft] = linters
		end
	end
	return out
end

-- Applies per-linter config overrides to a lint instance
-- Config values may be a table (assigned directly) or a function(lint)
function M.apply_linter_configs(lint)
	for _, lang in pairs(load_all()) do
		for name, cfg in pairs((lang.linters or {}).config or {}) do
			if type(cfg) == "function" then
				cfg(lint)
			else
				lint.linters[name] = cfg
			end
		end
	end
end

-- Deduplicated list of DAP adapter names for mason-nvim-dap ensure_installed
function M.mason_dap()
	local seen = {}
	local out = {}
	for _, lang in pairs(load_all()) do
		for _, adapter in ipairs((lang.dap or {}).mason or {}) do
			if not seen[adapter] then
				seen[adapter] = true
				table.insert(out, adapter)
			end
		end
	end
	return out
end

-- Calls each lang's dap.setup(dap, dapui) to register adapters and configurations
function M.apply_dap_configs(dap, dapui)
	for _, lang in pairs(load_all()) do
		if lang.dap and lang.dap.setup then
			lang.dap.setup(dap, dapui)
		end
	end
end

-- Collects all lazy.nvim plugin specs declared in lang files
function M.plugins()
	local out = {}
	for _, lang in pairs(load_all()) do
		vim.list_extend(out, lang.plugins or {})
	end
	return out
end

return M
