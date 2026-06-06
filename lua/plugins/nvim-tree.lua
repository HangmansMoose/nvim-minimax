-- ----------------------------
-- nvim-tree
-- 
-- Provides a tree view file browser.
-- ----------------------------
vim.pack.add({"https://github.com/nvim-tree/nvim-tree.lua"})


local nvimtree_setup, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_setup then
	return
end

-- recommended settings from nvim-tree docs
vim.g.loadednetrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color of arrows in tree
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- closed folder icon
					arrow_open = "", -- open folder icon
				},
			},
		},
	},
	-- disable window_picker for explorer to work well with window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	git = {
		ignore = false, -- show .gitignored files.
	},
})

