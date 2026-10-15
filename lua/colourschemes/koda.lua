vim.pack.add({'https://github.com/oskarnurm/koda.nvim'})

require('koda').setup({
	styles = {
		functions = { bold = false },
	},

	-- You can modify or extend highlight groups using the `on_highlights` configuration option
  -- Any changes made take effect when highlights are applied
  on_highlights = function(hl, c)
    -- hl.LineNr = { fg = c.info } -- change a specific highlight to use a different palette color
    hl.Comment = { fg = "#6f7b68" } -- modify a syntax group (add bold, italic, etc)
    -- hl.RainbowDelimiterRed = { fg = "#fb2b2b" } -- add a custom highlight group for another plugin
  end,
})

