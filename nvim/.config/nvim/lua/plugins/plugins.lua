return {
  "nvim-treesitter/nvim-treesitter",
  "nvim-telescope/telescope.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  },

  {
	"catppuccin/nvim",
	name = "catppuccin",
        config = function()
        vim.g.catppuccin_flavour = "mocha"  -- choose your flavour
        require("catppuccin").setup({transparent_background = true,term_colors = true,})
        vim.cmd("colorscheme catppuccin")
        end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	    require("lualine").setup({
		    options = { 
			    theme = "nightfly",
			    section_separators = "",
			    component_separators = "",
		    },
	    })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  }
}

