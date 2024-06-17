local my_plugins = {
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },
    { 'morhetz/gruvbox' },
    {
        "neoclide/coc.nvim",
        branch = 'release'
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("configs.nvim-tree")
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
        }
    },
    {
        "akinsho/bufferline.nvim",
        event = { "BufEnter" },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("configs.bufferline")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "hedyhli/outline.nvim",
        lazy = false,
        cmd = { "Outline", "OutlineOpen" },
        config = function()
            require("configs.outline")
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').load_extension('projects')
        end
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("configs.project_nvim")
        end
    },
    {
        'ethanholz/nvim-lastplace',
        config = function()
            require 'nvim-lastplace'.setup {
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                lastplace_open_folds = true
            }
        end
    }
}

-- configuration for lazy itself.
local lazy_opts = {
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",
    },
}

require("lazy").setup(my_plugins, lazy_opts)
