-- https://github.com/georgeguimaraes/review.nvim
return {
  {
    "georgeguimaraes/review.nvim",
    version = "*",
    dependencies = {
      {
        "esmuellert/codediff.nvim",
        opts = {
          explorer = { view_mode = "tree", width = 25 }, -- Match neo-tree.
        },
      },
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>rr", "<cmd>Review<cr>", desc = "Review working tree" },
      { "<leader>rc", "<cmd>Review commits<cr>", desc = "Review commits" },
      { "<leader>rb", "<cmd>Review branch<cr>", desc = "Review branch" },
      { "<leader>rn", ":Review note<cr>", mode = { "n", "v" }, desc = "Review: note here" },
      { "<leader>re", "<cmd>Review edit<cr>", desc = "Review: edit comment" },
      { "<leader>rd", "<cmd>Review delete<cr>", desc = "Review: delete comment" },
      { "<leader>rx", "<cmd>Review export<cr>", desc = "Review: export" },
    },
    opts = {},
    init = function()
      local function wrap_diff_panes(tabpage)
        local original, modified = require("codediff.ui.lifecycle").get_windows(tabpage)
        for _, win in ipairs({ original, modified }) do
          if win and vim.api.nvim_win_is_valid(win) then
            vim.wo[win].wrap = true
          end
        end
      end

      local group = vim.api.nvim_create_augroup("CodeDiffWrapLines", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "CodeDiffOpen",
        callback = function(event)
          -- CodeDiff schedules its first render after this event; reapply afterwards.
          vim.schedule(function()
            wrap_diff_panes(event.data.tabpage)
          end)
        end,
      })
      -- CodeDiff resets 'wrap' during re-renders (including file switches).
      vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "CursorMoved" }, {
        group = group,
        callback = function()
          local lifecycle = package.loaded["codediff.ui.lifecycle"]
          if not lifecycle then
            return
          end
          local tabpage = vim.api.nvim_get_current_tabpage()
          local original, modified = lifecycle.get_windows(tabpage)
          local win = vim.api.nvim_get_current_win()
          if win == original or win == modified then
            vim.wo[win].wrap = true
          end
        end,
      })
    end,
  },
}
