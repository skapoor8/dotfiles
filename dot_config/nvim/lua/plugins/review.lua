-- https://github.com/georgeguimaraes/review.nvim
return {
  {
    "georgeguimaraes/review.nvim",
    version = "*",
    dependencies = {
      {
        "esmuellert/codediff.nvim",
        opts = {
          highlights = {
            -- Visible backgrounds tinted from Vercel Dark green (#00ac3a) and red (#f32e40).
            line_insert = "#123f25",
            line_delete = "#4c1b25",
            -- CodeDiff always adds character-level extmarks; keep their tint
            -- only slightly brighter than the full-line backgrounds.
            char_insert = "#18502e",
            char_delete = "#5c2530",
          },
          diff = { highlight_added_deleted_files = true },
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
      -- CodeDiff forces nowrap when creating and rendering panes to align scrolling.
      -- It has no wrap option, so reapply it after renders; wrapped rows may
      -- affect synchronized scrolling. Also handle one-sided added/deleted files.
      local function wrap_diff_panes(tabpage)
        local original, modified = require("codediff.ui.lifecycle").get_windows(tabpage)
        for _, win in pairs({ original, modified }) do
          if win and vim.api.nvim_win_is_valid(win) then
            vim.wo[win].wrap = true
          end
        end
      end

      local function wrap_after_render(tabpage)
        -- CodeDiff schedules rendering from these events. Queue one turn behind
        -- that render so its 'nowrap' reset cannot undo the setting.
        vim.schedule(function()
          vim.schedule(function()
            for _, tab in ipairs(tabpage and { tabpage } or vim.api.nvim_list_tabpages()) do
              if vim.api.nvim_tabpage_is_valid(tab) then
                wrap_diff_panes(tab)
              end
            end
          end)
        end)
      end

      local group = vim.api.nvim_create_augroup("CodeDiffWrapLines", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = { "CodeDiffOpen", "CodeDiffFileSelect" },
        callback = function(event)
          wrap_after_render(event.data and event.data.tabpage)
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "CodeDiffVirtualFileLoaded",
        callback = function()
          wrap_after_render()
        end,
      })
      -- Keep wrapping if another re-render follows these events.
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
