return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find files (cwd)" },
      { "<leader>fF", LazyVim.pick("files"), desc = "Find files (root dir)" },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (root dir)" },
    },
  },
}
