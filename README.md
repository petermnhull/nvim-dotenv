# nvim-dotenv

Tiny Neovim plugin for setting env vars from a `test.env` file in the root directory of the project you're working on, originally intended to use with [neotest](https://github.com/nvim-neotest/neotest).

Adds the command `SetEnv`.

## Installation

For Lazy:

```
return {
	"petermnhull/nvim-dotenv",
	config = function()
		require("nvim-dotenv").setup({})

		vim.keymap.set("n", "<leader>ts", "<Cmd>SetEnv<CR>", { desc = "[s]et env from test.env file" })
	end,
}
```

## TODO

Some ideas to make this into a proper plugin.

- Let client set key mapping instead.
- Option for specifying which `.env` file to use.
- Option for running the function on start up.
