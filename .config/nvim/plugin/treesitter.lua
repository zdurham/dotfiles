vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		version = "main",
	},
})


require("nvim-treesitter").install({
  "comment",
  "css",
  "fish",
  "html",
	"javascript",
  "json",
	"lua",
  "markdown",
  "markdown_inline",
  "rust",
  "sql",
  "toml",
  "typescript",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype and filetype ~= "" then
			pcall(vim.treesitter.start)
		end
	end,
})

