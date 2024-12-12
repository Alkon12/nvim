return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest",
    },
    opts = function()
      return {
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          require("neotest-jest")({}),
        },
      }
    end,
    keys = {
      { "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>", desc = "Run nearest test" },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run test file" },
      { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary" },
    },
  },
}
