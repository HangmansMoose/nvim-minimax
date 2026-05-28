vim.pack.add({"https://github.com/dmtrKovalenko/fff.nvim"})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

fff = require('fff')

vim.keymap.set('n', '<leader>ff', fff.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', fff.live_grep, { desc = '[F]ind by [G]rep' })


