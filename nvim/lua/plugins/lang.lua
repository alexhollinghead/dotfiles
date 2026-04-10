-- Surfaces any plugin specs declared in lua/lang/*.lua files to lazy.nvim.
-- Add language-specific plugins to the `plugins` field in a lang file instead
-- of adding them here directly.
return require("lang").plugins()
