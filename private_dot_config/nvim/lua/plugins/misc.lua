return {
  {
    "lambdalisue/vim-suda",
    setup = function()
      vim.g.suda_smart_edit = 1
      vim.api.nvim_create_user_command("W", "SudaWrite", {})
    end,
  },
  {
    "herisetiawan00/jtt.nvim",
    keys = {
      { "<leader>tj", "<cmd>JumpTest<cr>", desc = "Swap to/from test file" },
    },
    opts = {
      languages = {
        typescript = { mode = "suffix", test = ".test", ext = ".ts" },
      },
    },
  },
  { "nvim-mini/mini.align", version = "*", config = true, event = { "BufReadPost", "BufNewFile" } },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      scratch = {
        ft = function()
          local default = (vim.bo.buftype == "" and vim.bo.filetype ~= "") and vim.bo.filetype or "markdown"
          local ft = vim.fn.input({ prompt = "Filetype: ", default = default, completion = "filetype" })
          return ft ~= "" and ft or default
        end,
      },
    },
  },
}
