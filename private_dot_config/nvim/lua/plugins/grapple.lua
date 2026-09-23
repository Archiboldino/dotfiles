return {
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git_branch",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      {
        "<leader>H",
        function()
          require("grapple").toggle()
          vim.cmd("redrawtabline")
        end,
        desc = "Grapple toggle tag",
      },
      { "<leader>h", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
      { "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Grapple select 5" },
      { "<leader>6", "<cmd>Grapple select index=6<cr>", desc = "Grapple select 6" },
      { "<leader>7", "<cmd>Grapple select index=7<cr>", desc = "Grapple select 7" },
      { "<leader>8", "<cmd>Grapple select index=8<cr>", desc = "Grapple select 8" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = function()
      local function marked_paths()
        local ok, grapple = pcall(require, "grapple")
        if not ok then
          return {}
        end
        local paths = {}
        for i, tag in ipairs(grapple.tags() or {}) do
          paths[tag.path] = i
        end
        return paths
      end

      return {
        options = {
          custom_filter = function(buf)
            local name = vim.api.nvim_buf_get_name(buf)
            return marked_paths()[name] ~= nil
          end,
          sort_by = function(a, b)
            local marks = marked_paths()
            local name_a = vim.api.nvim_buf_get_name(a.id)
            local name_b = vim.api.nvim_buf_get_name(b.id)
            return (marks[name_a] or 0) < (marks[name_b] or 0)
          end,
          name_formatter = function(buf)
            local marks = marked_paths()
            local name = vim.api.nvim_buf_get_name(buf.bufnr)
            local idx = marks[name]
            if idx then
              return "[" .. idx .. "] " .. buf.name
            end
            return buf.name
          end,
        },
      }
    end,
  },
}
