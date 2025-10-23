return {
  "nvim-treesitter/nvim-treesitter",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  {
	"catppuccin/nvim",
	name = "catppuccin",
        config = function()
        vim.g.catppuccin_flavour = "mocha"  -- choose your flavour
        require("catppuccin").setup({transparent_background = true,term_colors = true,})
        vim.cmd("colorscheme catppuccin")
        end
    }
}

