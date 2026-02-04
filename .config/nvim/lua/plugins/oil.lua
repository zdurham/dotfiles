return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ["<C-l>"] = false,
          ["<C-h>"] = false,
        },
      })
      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      -- vim.keymap.del("n", "<C-l>")
      -- vim.keymap.del("n", "<C-h>")
    end,
  },
}
