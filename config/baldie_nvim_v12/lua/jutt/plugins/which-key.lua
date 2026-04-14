return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
      delay = 0,
      icons = { mappings = true },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
