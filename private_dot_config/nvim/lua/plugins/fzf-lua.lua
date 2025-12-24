return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<Space>/", LazyVim.pick("live_grep", { resume = true }), mode = "n", nowait = true },
      { "<leader>/", LazyVim.pick("grep_visual", { resume = true }), mode = "x", desc = "Word (Root Dir)" },
      { "<leader><space>", LazyVim.pick("files", { resume = true }), desc = "Find Files (Root Dir)" },
    },
  },
}
