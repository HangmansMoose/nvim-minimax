vim.pack.add({
	'https://github.com/stevearc/overseer.nvim'
})

overseer = require('overseer')

overseer.setup({
    output = {
        -- Use a terminal buffer to display output. If false, a normal buffer is used
        use_terminal = true,
        -- If true, don't clear the buffer when a task restarts
        preserve_output = true,
    },
    form = {
			border = "rounded",
			win_opts = { winblend = 0 },
		},
})


-- The :OverseerShell command allows you to run a shell command as an overseer task.
-- It's a bit much to type, so we can create an abbreviation for that so now 
-- can simply call :OS build.bat to run the build.bat as an overseer task:
vim.cmd.cnoreabbrev("OS OverseerShell")

-- Create window that displays most recent task output

vim.keymap.set('n', '<leader>ot', 
    function()
      overseer.create_task_output_view(0, {
        list_task_opts = {
          filter = function(task)
            return task.time_start ~= nil
          end,
        },
        select = function(self, tasks, task_under_cursor)
          table.sort(tasks, function(a, b)
            return a.time_start > b.time_start
          end)
          return tasks[1]
        end,
      })
    end, 
{ desc = 'show [O]verseer last [T]ask in new window' })
