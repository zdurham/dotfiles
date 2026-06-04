vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim", name = "snacks" } 
})

require("snacks").setup()

vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end)
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end)
