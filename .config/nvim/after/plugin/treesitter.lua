local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then
  print("No tree sitter?")
end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "astro",
    "dockerfile",
    "elm",
    "go",
    "gomod",
    "graphql",
    "haskell",
    "json",
    "javascript",
    "html",
    "lua",
    "markdown",
    "python",
    "rust",
    "sql",
    "toml",
    "yaml",
    "fish",
    "css",
    "c",
    "bash"
  },
  autotag = {
    enable = true
  }
}


