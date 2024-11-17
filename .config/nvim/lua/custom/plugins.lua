local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
	    "nvim-tree/nvim-tree.lua",
	    dependencies = "nvim-tree/nvim-web-devicons",
        config = function ()
            require "plugins.configs.nvimtree"
            require "custom.configs.nvimtree"
        end
    },
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function ()
            require "custom.configs.alpha"
        end,
    },
    {
	    "numToStr/Comment.nvim",
	    event = { "BufReadPre", "BufNewFile" },
	    dependencies = {
		    "JoosepAlviste/nvim-ts-context-commentstring",
	    },
	    config = function()
		    require "custom.configs.comment"
        end,
    },
    {
        "szw/vim-maximizer",
	    keys = {
	    	{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	    },
    },
    {
    	"lukas-reineke/indent-blankline.nvim",
    	event = { "BufReadPre", "BufNewFile" },
    	main = "ibl",
    	opts = {
    		indent = { char = "┊" },
	    },
    },
    {
    	"folke/trouble.nvim",
    	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    	opts = {
    		focus = true,
    	},
    	cmd = "Trouble",
    	keys = {
	    	--    { "<leader>xx", "<cmd>Trouble toggle<CR>", desc = "Open/close trouble list" },
	    	{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
	    	{
	    		"<leader>xd",
	    		"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	    		desc = "Open trouble document diagnostics",
	    	},
	    	{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
    		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
    		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
    	},
    },
    {
	    "rmagatti/auto-session",
	    config = function()
    	    require "custom.configs.auto-session"
    	end,
    },
    {
	    "windwp/nvim-autopairs",
	    event = { "InsertEnter" },
	    dependencies = {
	    	"hrsh7th/nvim-cmp",
	    },
	    config = function()
            require "custom.configs.autopairs"
        end,
    },
    {
	    "folke/todo-comments.nvim",
	    event = { "BufReadPre", "BufNewFile" },
	    dependencies = { "nvim-lua/plenary.nvim" },
	    config = function()
            require "custom.configs.todo-comments"
        end,
    },
}
return plugins
