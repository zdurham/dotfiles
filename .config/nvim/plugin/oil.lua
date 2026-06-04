vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
  { src = "https://github.com/stevearc/oil.nvim", name = "oil" }
})

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

