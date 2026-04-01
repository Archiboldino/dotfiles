return {
  -- {
  --   "yetone/avante.nvim",
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     provider = "gemini-cli",
  --     acp_providers = {
  --       ["gemini-cli"] = {
  --         command = "gemini",
  --         args = { "--acp" },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "vaijab/gemini-cli.nvim",
  --   build = ":GeminiBuild", -- Essential: builds the Go server
  --   opts = {},
  -- },
  {
    "linw1995/nvim-mcp",
    build = "cargo install --path .",
    opts = {},
  },
}
