-- williamboman/mason.nvim lsp installer
require("mason").setup({
	-- The directory in which to install packages.
	-- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },
	install_root_dir = vim.fn.expand('$HOME') .. "/.local/share/nvim/language-server-protocol",
	ui = {
		-- Whether to automatically check for new versions when opening the :Mason window.
		check_outdated_packages_on_open = false,
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		},
		keymaps = {
			-- Keymap to expand a package
			toggle_package_expand = "<CR>",
			-- Keymap to install the package under the current cursor position
			install_package = "i",
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "u",
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = "c",
			-- Keymap to update all installed packages
			update_all_packages = "U",
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = "C",
			-- Keymap to uninstall a package
			uninstall_package = "X",
			-- Keymap to cancel a package installation
			cancel_installation = "<C-c>",
			-- Keymap to apply language filter
			apply_language_filter = "<C-f>",
		},
	},
	pip = {
		-- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
		-- and is not recommended.
		--
		-- Example: { "--proxy", "https://proxyserver" }
		install_args = {},
	},
	-- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
	-- debugging issues with package installations.
	log_level = vim.log.levels.INFO,
	-- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
	-- packages that are requested to be installed will be put in a queue.
	max_concurrent_installers = 4,
	github = {
		-- The template URL to use when downloading assets from GitHub.
		-- The placeholders are the following (in order):
		-- 1. The repository (e.g. "rust-lang/rust-analyzer")
		-- 2. The release version (e.g. "v0.3.0")
		-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},
})

require("mason-lspconfig").setup({
	-- automatically detect which servers to install (based on which servers are set up via lspconfig)
	--  This setting has no relation with the `ensure_installed` setting.
	automatic_installation = true,
	ensure_installed = {
		"bashls",
		"clangd",
		"cmake",
		"unocss", -- css
		"denols",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"elixirls",
		"gopls",
		"html",
		"intelephense",
		"julials",
		"kotlin_language_server",
		"lua_ls",
		"psalm",
		"pyright",
		"pylsp",
		"quick_lint_js",
		"sqlls",
		"tsserver",
		"vimls",
		"vtsls",
	}
})
