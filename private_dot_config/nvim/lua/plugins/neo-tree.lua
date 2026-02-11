return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
    },
  },
}
