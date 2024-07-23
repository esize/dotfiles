return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup({
			ensure_installed = { "prettierd", "eslint_d", "stylua", "black", "isort" },
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"eslint",
				"tailwindcss",
				"biome", -- js, ts, json
				"taplo", -- toml language server
				"nil_ls", -- nix language server
				"html",
				"docker_compose_language_service",
				"dockerls",
				"emmet_ls",
			},
		})
	end,
}
