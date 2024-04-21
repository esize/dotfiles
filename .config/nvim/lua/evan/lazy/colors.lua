function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = true,
                default_integrations = true,
                integrations = {
                    cmp = true,
                    treesitter = true,
                    harpoon = true,
                    mason = true,
                    lsp_trouble = true,
                }

            })
            vim.cmd("colorscheme catppuccin")

            ColorMyPencils()
        end
    },


}
