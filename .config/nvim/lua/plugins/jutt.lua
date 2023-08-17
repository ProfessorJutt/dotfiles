return {
  {
    "Mofiqul/vscode.nvim",
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<CMD> TmuxNavigateLeft<CR>", desc = "Tmux left" },
      { "<C-l>", "<CMD> TmuxNavigateRight<CR>", desc = "Tmux right" },
      { "<C-j>", "<CMD> TmuxNavigateDown<CR>", desc = "Tmux down" },
      { "<C-k>", "<CMD> TmuxNavigateUp<CR>", desc = "Tmux up" },
    },
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<leader><leader>", desc = "Increment Selection." },
      { "<BS>", desc = "Decrement Selection." },
    },
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-n>", "<CMD>Neotree toggle<CR>", desc = "NeoTree" },
      { "<leader>e", "<CMD>Neotree focus<CR>", desc = "NeoTree" },
    },
  },

  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.java" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.terraform" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.yaml" },

  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
         .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
        | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
        | |   ______     | || |      __      | || |   _____      | || |  ________    | || |     _____    | || |  _________   | |
        | |  |_   _ \    | || |     /  \     | || |  |_   _|     | || | |_   ___ `.  | || |    |_   _|   | || | |_   ___  |  | |
        | |    | |_) |   | || |    / /\ \    | || |    | |       | || |   | |   `. \ | || |      | |     | || |   | |_  \_|  | |
        | |    |  __'.   | || |   / ____ \   | || |    | |   _   | || |   | |    | | | || |      | |     | || |   |  _|  _   | |
        | |   _| |__) |  | || | _/ /    \ \_ | || |   _| |__/ |  | || |  _| |___.' / | || |     _| |_    | || |  _| |___/ |  | |
        | |  |_______/   | || ||____|  |____|| || |  |________|  | || | |________.'  | || |    |_____|   | || | |_________|  | |
        | |              | || |              | || |              | || |              | || |              | || |              | |
        | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
         '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
      ]]
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },
  {
    "theprimeagen/harpoon",
    keys = {
      {
        "<leader>a",
        mode = "n",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon Mark",
      },
      {
        "<A-h>",
        mode = "n",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon UI",
      },
      {
        "<A-j>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Harpoon 1",
      },
      {
        "<A-k>",
        mode = "n",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Harpoon 2",
      },
      {
        "<A-l>",
        mode = "n",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Harpoon 3",
      },
      {
        "<A-;>",
        mode = "n",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Harpoon 4",
      },
    },
    config = function() end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>ut", vim.cmd.UndotreeToggle, mode = "n", desc = "Undo Tree" },
    },
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
      {
        "<leader>/",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        mode = "n",
        desc = "Toggle Comment",
      },
      {
        "<leader>/",
        "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        mode = "v",
      },
    },
  },
}
