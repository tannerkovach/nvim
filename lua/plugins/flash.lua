return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = {
        enabled = true
      }
    }
  },
  labels = {
    after = { 0, 0 },
    style = {
        'overlay'
    }
  },
  keys = {
    { 
      "s",
      mode = { "n", "x", "o" },
      function() 
        require("flash").jump()
      end,
      desc = "Flash" 
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^"
        })
      end,
      desc = "Flash Line Jump"
    },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}
