require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = false },
        keywords = { italic = false }
    }}
)

vim.cmd[[colorscheme tokyonight]]
