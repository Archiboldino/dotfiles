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
}
