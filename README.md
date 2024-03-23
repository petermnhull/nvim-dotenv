# nvim-dotenv

Tiny Neovim plugin for setting env vars from a `test.env` file in the root directory of the project you're working on, originally intended to use with [neotest](https://github.com/nvim-neotest/neotest).

Run `<Space>ts` to set the environment variables.

## Installation

For Lazy:

```
return {
  'petermnhull/nvim-dotenv.nvim',
  opts = {}
}
```

## TODO

Some ideas to make this into a proper plugin.

- Let client set key mapping instead.
- Option for specifying which `.env` file to use.
- Option for running the function on start up.
