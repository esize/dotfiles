return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					sections = {
						lualine_a = { "mode" },
						lualine_b = { "branch", "diff" },
						lualine_c = { "filename" },
						lualine_x = { "fileformat", "filetype" },
						lualine_y = { "diagnostics" },
						lualine_z = { "location" },
					},
				},
			})
		end,
	},
	{ "nvim-tree/nvim-web-devicons", opts = {}, lazy = true },
}
