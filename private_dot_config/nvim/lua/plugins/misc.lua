return {
  {
    "lambdalisue/vim-suda",
    setup = function()
      vim.g.suda_smart_edit = 1
      vim.api.nvim_create_user_command("W", "SudaWrite", {})
    end,
  },
  {
    "pteroctopus/faster.nvim",
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git_branch",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>H", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>h", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
      { "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Grapple select 5" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_b, { "grapple" })
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
