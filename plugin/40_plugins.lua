-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘
--
-- This file contains installation and configuration of plugins outside of MINI.
-- They significantly improve user experience in a way not yet possible with MINI.
-- These are mostly plugins that provide programming language specific behavior.

-- Stole this from kickstart while I better understand mini 
local function run_build(name, cmd, cwd)
    local result = vim.system(cmd, { cwd = cwd }):wait()
    if result.code ~= 0 then
      local stderr = result.stderr or ''
      local stdout = result.stdout or ''
      local output = stderr ~= '' and stderr or stdout
      if output == '' then output = 'No output from build command.' end
      vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
    end
  end

  -- This autocommand runs after a plugin is installed or updated and
  --  runs the appropriate build command for that plugin if necessary.
  --
  -- See `:help vim.pack-events`
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      local name = ev.data.spec.name
      local kind = ev.data.kind
      if kind ~= 'install' and kind ~= 'update' then return end

      if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
        --run_build(name,{'cmake', '-S.', '-Bbuild', '-DCMAKE_BUILD_TYPE=Release', '&&', 'cmake', '--build', 'build', '--config', 'Release', '--target', 'install'}, ev.data.path)
        run_build(name,{'make'}, ev.data.path)
        return
      end

      if name == 'LuaSnip' then
        if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
        return
      end

      if name == 'nvim-treesitter' then
        if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
        vim.cmd 'TSUpdate'
        return
      end
    end,
  })

-- Ensure colour is loaded before any plugins so that it remains consistent through the load process
-- even if something errors
-- Use this file to install and configure other such plugins.
-- UI2
require('vim._core.ui2').enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = 'cmd',
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5 -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 4000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 1, -- Maximum height.
    },
  },
})

-- Make concise helpers for installing/adding plugins in two stages
local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

-- Tree-sitter ================================================================

-- Tree-sitter is a tool for fast incremental parsing. It converts text into
-- a hierarchical structure (called tree) that can be used to implement advanced
-- and/or more precise actions: syntax highlighting, textobjects, indent, etc.
--
-- Tree-sitter support is built into Neovim (see `:h treesitter`). However, it
-- requires two extra pieces that don't come with Neovim directly:
-- - Language parsers: programs that convert text into trees. Some are built-in
--   (like for Lua), 'nvim-treesitter' provides many others.
--   NOTE: It requires third party software to build and install parsers.
--   See the link for more info in "Requirements" section of the MiniMax README.
-- - Query files: definitions of how to extract information from trees in
--   a useful manner (see `:h treesitter-query`). 'nvim-treesitter' also provides
--   these, while 'nvim-treesitter-textobjects' provides the ones for Neovim
--   textobjects (see `:h text-objects`, `:h MiniAi.gen_spec.treesitter()`).
--
-- Add these plugins now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.treesitter nvim-treesitter` to see potential issues.
-- - In case of errors related to queries for Neovim bundled parsers (like `lua`,
--   `vimdoc`, `markdown`, etc.), manually install them via 'nvim-treesitter'
--   with `:TSInstall <language>`. Be sure to have necessary system dependencies
--   (see MiniMax README section for software requirements).
now_if_args(function()
  -- Define hook to update tree-sitter parsers after plugin is updated
  local ts_update = function() vim.cmd('TSUpdate') end
  Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

  add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  })

  -- Define languages which will have parsers installed and auto enabled
  -- After changing this, restart Neovim once to install necessary parsers. Wait
  -- for the installation to finish before opening a file for added language(s).
  local languages = {
    -- These are already pre-installed with Neovim. Used as an example.
    'lua',
    'vimdoc',
    'markdown',
    -- Add here more languages with which you want to use tree-sitter
    'c',
    'cpp',
    'gdscript',
    'zig',
    'rust',
    'go',
    'json',
    'odin',
    -- To see available languages:
    -- - Execute `:=require('nvim-treesitter').get_available()`
    -- - Visit 'SUPPORTED_LANGUAGES.md' file at
    --   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- Language servers ===========================================================

-- Language Server Protocol (LSP) is a set of conventions that power creation of
-- language specific tools. It requires two parts:
-- - Server - program that performs language specific computations.
-- - Client - program that asks server for computations and shows results.
--
-- Here Neovim itself is a client (see `:h vim.lsp`). Language servers need to
-- be installed separately based on your OS, CLI tools, and preferences.
-- See note about 'mason.nvim' at the bottom of the file.
--
-- Neovim's team collects commonly used configurations for most language servers
-- inside 'neovim/nvim-lspconfig' plugin.
--
-- Add it now if file (and not 'mini.starter') is shown after startup.

-- LSPNESS =====================================================================================
now_if_args(function()
  add({ 
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim'
  })
 --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('hangmansmoose-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client:supports_method('textDocument/inlayHint', event.buf) then
            map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --  See `:help lsp-config` for information about keys and how to configure
      ---@type table<string, vim.lsp.Config>
      local servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--header-insertion=never",
            "-j=4",
          },
        },
        gopls = {},
        ols = {}, -- odin language server
        pyright = {},
        rust_analyzer = {},
        zls = {}, 
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      require('mason').setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        -- You can add other tools here that you want Mason to install
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
end)

-- LUALINE =======================================================
now_if_args(function()
  add({ 'https://github.com/nvim-lualine/lualine.nvim' })
    require("lualine").setup({
       options = {
            icons_enabled = true,
            theme = "auto",
            globalstatus = true,
        },
      sections = {
        lualine_c = {
              {
            	  "filename",
            	  path = 3,
                }
        },
      },
  })
end)


-- FOLKE ===========================================
now_if_args(function()
  add({ 
    'https://github.com/folke/trouble.nvim',
    'https://github.com/folke/todo-comments.nvim',
    'https://github.com/nvim-lua/plenary.nvim'
  })
  require('trouble').setup()
  require("todo-comments").setup({
				keywords = {
					TODO = { color = "#ff0000" },
					HACK = { color = "#ff6600" },
					NOTE = { color = "#008000" },
					FIXME = { color = "#f06292" },
					LEFTOFF = { color = "#ffff99" },
					nocheckin = { color = "#ff00ff" },
				},
				-- Pattern to hightlight the keywords
				highlight = {
					pattern = [[(KEYWORDS|keywords)\s*(\([^\)]*\))?:]],
					keyword = "fg",
					after = "",
					before = "",
				},
				gui_style = {
					fg = "BOLD",
				},
			})
end)

-- COLOURS ====================================================================
Config.now(function()
--  -- Install only those that you need
  add({
    'https://github.com/WTFox/jellybeans.nvim',
    'https://github.com/blazkowolf/gruber-darker.nvim',
    'https://github.com/rebelot/kanagawa.nvim',
    'https://github.com/alljokecake/naysayer-theme.nvim',
    'https://github.com/savq/melange-nvim',
    'https://github.com/tjdevries/colorbuddy.nvim',
    'https://github.com/54L1M/Oshen.nvim',
    'https://github.com/szymonwilczek/arete.nvim'
  })
--   -- Enable only one
--   vim.cmd('colo gruvbuddy')
end)

local colours = require("utils.colors")
colours.CustomColourscheme("Oshen")
-- TODO: This needs a better place to live. Makes the custom color function available as a command
vim.api.nvim_create_user_command("Colour", function(args)
      local scheme = args.fargs[1]
      colours.CustomColourscheme(scheme)
    end,
    {
      nargs = "?",
      complete = "color"
    }
)

-- TELESCOPE (MOVE THIS TO ITS OWN FILE)
local telescope_plugins = {
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-ui-select.nvim',
    'https://github.com/nvim-telescope/telescope-file-browser.nvim',
		'https://github.com/nvim-telescope/telescope-symbols.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
}

  
  -- NOTE: You can install multiple plugins at once
vim.pack.add(telescope_plugins)

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local fb_actions = require("telescope").extensions.file_browser.actions
 -- See `:help telescope` and `:help telescope.setup()`
 require('telescope').setup {
   -- You can put your default mappings / updates / etc. in here
   --  All the info you're looking for is in `:help telescope.setup()`
   --
   defaults = {
     file_ignore_patterns = {
       "^libs/",
 			"^includes/",
 			"^build/",
 			"^Build/",
       "^bin/",
       "^Bin/",
       "^thirdparty/",
       "^dependencies/",
       "^Thirdparty/",
       "^Dependencies/",
       "%.lib",
 			"%.so",
 			"%.exe",
 			"%.pdb",
 			"%.rdi",
 			"%.obj"

     }
   --   mappings = {
   --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
   --   },
   },
   pickers = {
     buffers = {
       previewer = false,
       theme = "dropdown",
       intitial_mode = "insert"
     },
     find_files = {
 				-- theme = 'ivy', -- 'ivy', 'dropdown', 'cursor'
 				-- layout_strategy = 'vertical',
 				-- layout_config = { height = 0.9 },
 				-- previewer = false,
 				path_display = { "smart" },
 				layout_config = {
 					prompt_position = "top",
 					preview_width = 0.5,
 					-- width = 0.7,
 				},
 				sorting_strategy = "ascending",
 			},
 			help_tags = {
 				theme = "ivy",
 			},
 			symbols = {
 				theme = "dropdown",
 			},
 			registers = {
 				theme = "ivy",
 			},
 			grep_string = {
 				initial_mode = "normal",
 				theme = "ivy",
 			},
 			live_grep = {
 				theme = "ivy",
 			},
 		},
   extensions = {
     ['ui-select'] = { require('telescope.themes').get_dropdown() },
     file_browser = {
 				dir_icon = "",
 				prompt_path = true,
 				grouped = true,
 				theme = "dropdown",
 				initial_mode = "normal",
 				previewer = false,
 				mappings = {
 					n = {
 						["o"] = "select_default",
 						["H"] = fb_actions.toggle_hidden,
 						["h"] = fb_actions.goto_parent_dir,
 						["l"] = "select_default",
 					},
 				},
 			},
 			undo = {
 				initial_mode = "normal",
 				side_by_side = true,
 				theme = "ivy",
 				layout_config = {
 					preview_width = 0.7,
 				},
 			},
 			heading = {
 				treesitter = true,
 			},
   },
 }

 -- Enable Telescope extensions if they are installed
 pcall(require('telescope').load_extension, 'fzf')
 pcall(require('telescope').load_extension, 'ui-select')

 -- See `:help telescope.builtin`
 local builtin = require 'telescope.builtin'
 vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
 vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
 vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
 vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
 vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
 vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
 vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
 vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
 vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })
 vim.keymap.set('n', "<leader>fs", builtin.symbols, {desc = "[F]ind [S]ymbols" })
 vim.keymap.set('n', "<leader>fq", builtin.quickfix, {desc = "Find Quickix" })
 vim.keymap.set('n', "<leader>fi", "<cmd>Telscope import<cr>", {desc = "Find Imports" })
 vim.keymap.set('n', "<leader>fz", "<cmd>Telescope zoxide list<cr>", {desc = "Find Directory" })

 -- Add Telescope-based LSP pickers when an LSP attaches to a buffer.
 -- If you later switch picker plugins, this is where to update these mappings.
 vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
   callback = function(event)
     local buf = event.buf

     -- Find references for the word under your cursor.
     vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })

     -- Jump to the implementation of the word under your cursor.
     -- Useful when your language has ways of declaring types without an actual implementation.
     vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })

     -- Jump to the definition of the word under your cursor.
     -- This is where a variable was first declared, or where a function is defined, etc.
     -- To jump back, press <C-t>.
     vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })

     -- Fuzzy find all the symbols in your current document.
     -- Symbols are things like variables, functions, types, etc.
     vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })

     -- Fuzzy find all the symbols in your current workspace.
     -- Similar to document symbols, except searches over your entire project.
     vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })

     -- Jump to the type of the word under your cursor.
     -- Useful when you're not sure what type a variable is and you want to see
     -- the definition of its *type*, not where it was *defined*.
     vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
   end,
 })

 -- Override default behavior and theme when searching
 vim.keymap.set('n', '<leader>/', function()
   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
     winblend = 10,
     previewer = false,
   })
 end, { desc = '[/] Fuzzily search in current buffer' })

 -- It's also possible to pass additional configuration options.
 --  See `:help telescope.builtin.live_grep()` for information about particular keys
 vim.keymap.set(
   'n',
   '<leader>s/',
   function()
     builtin.live_grep {
       grep_open_files = true,
       prompt_title = 'Live Grep in Open Files',
     }
   end,
   { desc = '[S]earch [/] in Open Files' }
 )

 -- Shortcut for searching your Neovim configuration files
 vim.keymap.set('n', '<leader>fn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = '[F]ind [N]eovim files' })
