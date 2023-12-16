return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     style = "latte",
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<C-Space>", desc = "Increment Selection." },
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
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<CMD>Neotree toggle<CR>", desc = "NeoTree" },
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
  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      --       local logo = [[
      --                   ,.,_,.
      --               ,.''     \
      --               '          '
      --             /'           |
      --           /_-            |
      --         .'__      _-_    :
      --       /__        _-_    :
      --       ,_,._     ,_,._~   |___
      --     .'-_ '.'.-.'-_ '.'._-^_  '.
      --     |  -_ |.| |  -_ | | / |
      --     ',_,' /  _',_,'_'  /|/
      --       .  .|    ',. ._-^  |'
      --       ' '.   .'  '.    '/|
      --     ,'    '''    __'.  \/ -_
      --     '_=-..--..--'^  '', : \. '.
      --         ',    .  ,   ,' \/ |  |-_
      --         / ',.. '. '. ,../  |  |  '-_
      --       ,'  . \'.:.''''    .''. '.    \.
      --     ,'    | |\       ,../   |  |      ',
      --     |     ' ''.,.''''       ', ',       |
      --
      -- ██████╗░░█████╗░██╗░░░░░██████╗░██╗███████╗
      -- ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██║██╔════╝
      -- ██████╦╝███████║██║░░░░░██║░░██║██║█████╗░░
      -- ██╔══██╗██╔══██║██║░░░░░██║░░██║██║██╔══╝░░
      -- ██████╦╝██║░░██║███████╗██████╔╝██║███████╗
      -- ╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝╚══════╝
      --       ]]
      local logo = [[
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWN0k0NWMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMWWMMMMMMMMNKkxdooododxk00kdoddookXWMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMWWWWWWWNkolccllllllll;.';''cxKWWWWMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMWWW0oc:ok0OOOOOOOOxclxkkdlccld0NWWWMMWMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMWWWXo;cxOOOOO0OOOOOOOOOOOOO00OdlccdKWWWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWWWO::odllcccccokOOOOOOOOOd::cccc:;..cOWWWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMWx..::clllodoodkOOOOOOOOOkdoddddlll:,,oKWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWk,;dxdlcc::cokOOOOOO0000O00koccccldkOk:;0WMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMO;lOd;.';:cdo,ckOOOOO000000x:,cc;:c;;dOk:;OMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMK::kk;      'Ox,lOOOOkkO000O:'c,   ...'xOk::KMMMMMMMMMMMMM
MMMMMMMMMMMMMMMNl,x0d.      .dd,lOO0d,'o000k'';      ..l0Oo,xWMMMMMMMMMMMM
MMMMMMMMMMMMMMWk,lOOd'',,;;:oo,cO00k,;;;O000c'cc;',:ol,oOOx,cNMMMMMMMMMMMM
MMMMMMMMMMMMWWWl,xOOk:',;;c:;;okO00l,dl,x000kl,:c:cc::okOOk,;XWWMMMMMMMMMM
MMMMMMMMMMMMMMXc;kOOOOxolllldkOOOd:,:Ok;:O00O0koc:lodOOOOOk,:NWMMMMMMMMMMM
MMMMMMMMMMMMMMNc;kOOOOOOOOOOOOOOd,.:OO0o'l0OOO00O00OOOOOO0k,oWWWMMMMMMMMMM
MMMMMMMMMMMMMMWd,dOOOOOOOOOOOOOO:;dkOO0Oc,d0OOOOOOOOOOOOOOd,dWMMMMMMMMMMMM
MMMMMMMMMMMMMMMK;:kOOOOOOOOOOOOk;:kOOOO0d,l0OOOOOOOOOOOOOk::KWMMMMMMMMMMMM
MMMMMMMMMMMMMWWWx,oOOOOOOOOOOOOk:;okOOOOd,l0OOOOOOOOOOO0Oc,kWWWMMMMMMMMMMM
MMMMMMMMMMMMMMWWNc,xOOOOOOOOOOOOx;';clc::lxOOOOOOOOOOOOOl,dWMWMMMMMMMMMMMM
MMMMMMMMMMMMMMMMM0::xOOOOOOOOOOOOkxdlcldkOOOOOOOOOOOOOkl,xNMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWXl;xOOOOOOOOOOOOkOOOOOOOOOOOkxxxkOOx::OWWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWWXd:oxkOocodddxxxkkxxxddolcc;;:okkc;dXWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMWWWXOdol::;,,;;;;;;;;;;,;,,:ldkkl;c0WWWWMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMWWMMWXOoc:clc::::::::cclodkOxl:cONWWWWWMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMWWWWXd:lkkkkkkkkkkOOOOkl;o0NWWWWWWWMMMMMMMMMMMMMMMM
MMMMMMMMMMMWWWMWXOxxddxddxk0Kk;:kOOOOOOOOOOOk::0WXK0Okddxx0XWWNKXNWWWMMMMM
MMMMMWWWNOoccloc;,'''',,,,,,;c;.lOOOOOOOOOOk:.:l::;,,,,,,,,;cc;,,;lKWWMMMM
MMMMMWNk:'';'..,:::::::::::::;'.'okOOOOOOOOl..,;::ccc::::cc;..;::;':KWWMMM
MMMMWXl.,;;;'.,:::::::::::::cc:;'',;ldddoo:',c:ccccc::c::c::'':c:::.cXWMWM

                  ██████╗░░█████╗░██╗░░░░░██████╗░██╗███████╗
                  ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██║██╔════╝
                  ██████╦╝███████║██║░░░░░██║░░██║██║█████╗░░
                  ██╔══██╗██╔══██║██║░░░░░██║░░██║██║██╔══╝░░
                  ██████╦╝██║░░██║███████╗██████╔╝██║███████╗
                  ╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝╚══════╝
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
        "<C-e>",
        mode = "n",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon UI",
      },
      {
        "<C-u>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Harpoon 1",
      },
      {
        "<C-i>",
        mode = "n",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Harpoon 2",
      },
      {
        "<C-o>",
        mode = "n",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Harpoon 3",
      },
      {
        "<C-p>",
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
}
