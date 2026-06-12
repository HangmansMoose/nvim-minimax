-- ┌──────────────────────────┐
-- │ Built-in Neovim behavior │
-- └──────────────────────────┘
--
-- This file defines Neovim's built-in behavior. The goal is to improve overall
-- usability in a way that works best with MINI.
--
-- Here `vim.o.xxx = value` sets default value of option `xxx` to `value`.
-- See `:h 'xxx'` (replace `xxx` with actual option name).
--
-- Option values can be customized on a per buffer or window basis.
-- See 'after/ftplugin/' for common example.
--
-- Notes:
-- - Some options (like `:h 'exrc'`) need to be set before this file is sourced.
--   Set them directly at the bottom of the 'init.lua' file.

-- stylua: ignore start
-- The next part (until `-- stylua: ignore end`) is aligned manually for easier
-- reading. Consider preserving this or remove `-- stylua` lines to autoformat.

-- Set <space> as the leader key
  -- See `:help mapleader`
  --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Set to true if you have a Nerd Font installed and selected in the terminal
  vim.g.have_nerd_font = true

  vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)
  -- [[ Setting options ]]
  --  See `:help vim.o`
  -- NOTE: You can change these options as you wish!
  --  For more options, you can see `:help option-list`

  -- Make line numbers default
  vim.o.number = true
  -- You can also add relative line numbers, to help with jumping.
  --  Experiment for yourself to see if you like it!
  vim.o.relativenumber = true

  -- Enable mouse mode, can be useful for resizing splits for example!
  vim.o.mouse = 'a'

  -- Don't show the mode, since it's already in the status line
  vim.o.showmode = false

  vim.o.wrap           = false      -- Don't visually wrap lines (toggle with \w)
  -- Sync clipboard between OS and Neovim.
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

  -- Enable break indent
  vim.o.breakindent = true
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4

  -- Enable undo/redo changes even after closing and reopening a file
  vim.o.undofile = true

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  vim.o.ignorecase = true
  vim.o.smartcase = true

  -- Keep signcolumn on by default
  vim.o.signcolumn = 'no'

  -- Decrease update time
  vim.o.updatetime = 250

  -- Decrease mapped sequence wait time
  vim.o.timeoutlen = 300

  -- Configure how new splits should be opened
  vim.o.splitright = true
  vim.o.splitbelow = true

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  --
  --  Notice listchars is set using `vim.opt` instead of `vim.o`.
  --  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
  --   See `:help lua-options`
  --   and `:help lua-guide-options`
  vim.o.list = false
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

  -- Preview substitutions live, as you type!
  vim.o.inccommand = 'split'

  -- Show which line your cursor is on
  vim.o.cursorline = true

  -- Minimal number of screen lines to keep above and below the cursor.
  vim.o.scrolloff = 10

  -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
  -- instead raise a dialog asking if you wish to save the current file(s)
  -- See `:help 'confirm'`
  vim.o.confirm = true

  -- Allow project dir functions defined by .nvim.lua file
  vim.o.exrc = true


  -- Allow project dir functions defined by .nvim.lua file
  vim.o.exrc = true

  vim.o.termguicolors  = true
  vim.o.shell = 'pwsh.exe -NoLogo -NoExit'
  -- Neovide ===============================================================
  if vim.g.neovide then
	vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor"
  end
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_position_animation_length = 0
  vim.o.guifont = "CaskaydiaMono_NF:Medium:h14:#e-subpixelantialias"
  vim.g.neovide_opacity = 1.00
  vim.g.neovide_normal_opacity = 1.00
  vim.g.neovide_title_background_color = "#000000"


-- General ====================================================================
--vim.g.mapleader = ' ' -- Use `<Space>` as <Leader> key
--
--vim.o.mouse       = 'a'            -- Enable mouse
--vim.o.mousescroll = 'ver:25,hor:6' -- Customize mouse scroll
--vim.o.switchbuf   = 'usetab'       -- Use already opened buffers when switching
--vim.o.undofile    = true           -- Enable persistent undo
--
--vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)
--
---- Enable all filetype plugins and syntax (if not enabled, for better startup)
--vim.cmd('filetype plugin indent on')
--if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end
--
---- UI =========================================================================
--vim.o.breakindent    = true       -- Indent wrapped lines to match line start
--vim.o.breakindentopt = 'list:-1'  -- Add padding for lists (if 'wrap' is set)
----vim.o.colorcolumn    = '+1'       -- Draw column on the right of maximum width
--vim.o.cursorline     = true       -- Enable current line highlighting
--vim.o.linebreak      = true       -- Wrap lines at 'breakat' (if 'wrap' is set)
--vim.o.list           = false       -- Show helpful text indicators
--vim.o.number         = true       -- Show line numbers
--vim.o.relativenumber = true
--vim.o.pumborder      = 'single'   -- Use border in popup menu
--vim.o.pumheight      = 10         -- Make popup menu smaller
--vim.o.pummaxwidth    = 100        -- Make popup menu not too wide
--vim.o.ruler          = false      -- Don't show cursor coordinates
--vim.o.shortmess      = 'CFOSWaco' -- Disable some built-in completion messages
--vim.o.showmode       = false      -- Don't show mode in command line
--vim.o.signcolumn     = 'yes'      -- Always show signcolumn (less flicker)
--vim.o.splitbelow     = true       -- Horizontal splits will be below
--vim.o.splitkeep      = 'screen'   -- Reduce scroll during window split
--vim.o.splitright     = true       -- Vertical splits will be to the right
--vim.o.winborder      = 'single'   -- Use border in floating windows
--vim.o.wrap           = false      -- Don't visually wrap lines (toggle with \w)
--vim.o.termguicolors  = true
--
--vim.o.cursorlineopt  = 'screenline,number' -- Show cursor line per screen line
--
---- Special UI symbols. More is set via 'mini.basics' later.
--vim.o.fillchars = 'eob: ,fold:╌'
--vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '
--
---- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
--vim.o.foldlevel   = 10       -- Fold nothing by default; set to 0 or 1 to fold
--vim.o.foldmethod  = 'indent' -- Fold based on indent level
--vim.o.foldnestmax = 10       -- Limit number of fold levels
--vim.o.foldtext    = ''       -- Show text under fold with its highlighting
--
---- Editing ====================================================================
--vim.o.autoindent    = true    -- Use auto indent
--vim.o.expandtab     = true    -- Convert tabs to spaces
--vim.o.formatoptions = 'rqnl1j'-- Improve comment editing
--vim.o.ignorecase    = true    -- Ignore case during search
--vim.o.incsearch     = true    -- Show search matches while typing
--vim.o.infercase     = true    -- Infer case in built-in completion
--vim.o.shiftwidth    = 2       -- Use this number of spaces for indentation
--vim.o.smartcase     = true    -- Respect case if search pattern has upper case
--vim.o.smartindent   = true    -- Make indenting smart
--vim.o.spelloptions  = 'camel' -- Treat camelCase word parts as separate words
--vim.o.tabstop       = 2       -- Show tab as this number of spaces
--vim.o.virtualedit   = 'block' -- Allow going past end of line in blockwise mode
--
--vim.o.iskeyword = '@,48-57,_,192-255,-' -- Treat dash as `word` textobject part
--
---- Pattern for a start of numbered list (used in `gw`). This reads as
---- "Start of list item is: at least one special character (digit, -, +, *)
---- possibly followed by punctuation (. or `)`) followed by at least one space".
--vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
--
---- Built-in completion
--vim.o.complete        = '.,w,b,kspell'                  -- Use less sources
--vim.o.completeopt     = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior
--vim.o.completetimeout = 100                             -- Limit sources delay

-- Neovide ===============================================================
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_scroll_animation_length = 0.15
vim.g.neovide_refresh_rate = 144
vim.g.neovide_position_animation_length = 0
vim.o.guifont = "CaskaydiaMono_NF:Medium:h13:#e-subpixelantialias"
vim.g.neovide_opacity = 1.00
vim.g.neovide_normal_opacity = 1.00

-- Autocommands ===============================================================

-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
local f = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end
Config.new_autocmd('FileType', nil, f, "Proper 'formatoptions'")

-- There are other autocommands created by 'mini.basics'. See 'plugin/30_mini.lua'.

-- Diagnostics ================================================================

-- Neovim has built-in support for showing diagnostic messages. This configures
-- a more conservative display while still being useful.
-- See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
local diagnostic_opts = {
  -- Show signs on top of any other sign, but only for warnings and errors
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },

  -- Show all diagnostics as underline (for their messages type `<Leader>ld`)
  underline = { severity = { min = 'HINT', max = 'ERROR' } },

  -- Show more details immediately for errors on the current line
  virtual_lines = false,
  virtual_text = {
    current_line = true,
    severity = { min = 'ERROR', max = 'ERROR' },
  },

  -- Don't update diagnostics when typing
  update_in_insert = false,
}

-- Use `later()` to avoid sourcing `vim.diagnostic` on startup
Config.later(function() vim.diagnostic.config(diagnostic_opts) end)
-- stylua: ignore end
