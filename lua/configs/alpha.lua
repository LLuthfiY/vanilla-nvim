local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
require("alpha.term")

local add_spaces = function(text, width)
	width = width or 32
	return text .. string.rep(" ", math.max(0, width - vim.fn.strdisplaywidth(text)))
end

local header = {
	type = "terminal",
	command = "viu -b ~/.config/nvim/static/kalsit_catppuccin.png",
	height = 18,
	width = 150,
	opts = {
		redraw = true,
	},
}

local find_files = {
	type = "button",
	val = add_spaces("  Find files"),
	on_press = function()
		require("telescope.builtin").find_files()
	end,
	opts = {
		position = "center",
		align_shortcut = "right",
		shortcut = "f",
		keymap = { { "n", "t" }, "f", "<cmd>Telescope find_files<cr>" },
	},
}

local new_file = {
	type = "button",
	val = add_spaces("  New file"),
	on_press = function()
		vim.cmd("enew")
	end,
	opts = {
		position = "center",
		align_shortcut = "right",
		shortcut = "n",
		keymap = { { "n", "t" }, "n", "<cmd>enew<cr>" },
	},
}

local recent_files = {
	type = "button",
	val = add_spaces("  Recently opened files"),
	on_press = function()
		require("telescope.builtin").oldfiles()
	end,
	opts = {
		position = "center",
		align_shortcut = "right",
		shortcut = "r",
		keymap = { { "n", "t" }, "r", "<cmd>Telescope oldfiles<cr>" },
	},
}

local update_plugins = {
	type = "button",
	val = add_spaces("  Update plugins"),
	on_press = function()
		require("lazy").update()
	end,
	opts = {
		position = "center",
		align_shortcut = "right",
		shortcut = "u",
		keymap = { { "n", "t" }, "u", "<cmd>Lazy update<cr>" },
	},
}

local config_nvim = {
	type = "button",
	val = add_spaces("  Config"),
	on_press = function()
		require("telescope.builtin").find_files({ cwd = "~/.config/nvim/" })
	end,
	opts = {
		position = "center",
		align_shortcut = "right",
		shortcut = "c",
		keymap = { { "n", "t" }, "c", "<cmd>Telescope find_files cwd=~/.config/nvim/<cr>" },
	},
}

local quit = {
	type = "button",
	val = add_spaces("  Quit", 31),
	on_press = function()
		vim.cmd("quit")
	end,
	opts = {
		position = "center",
		align_shortcut = "right",
		shortcut = "qq",
		keymap = { { "n", "t" }, "qq", "<cmd>quit<cr>" },
	},
}

local function footer()
	local datetime = os.date(" %Y-%m-%d   %H:%M")
	local version = vim.version()
	local nvim_version_info = " v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. " || " .. nvim_version_info
end

dashboard.section.footer.val = footer()

-- Send config to alpha
--
dashboard.config.layout = {
	{ type = "padding", val = 4 },
	header,
	{ type = "padding", val = 4 },
	find_files,
  { type = "padding", val = 1 },
	new_file,
  { type = "padding", val = 1 },
	recent_files,
  { type = "padding", val = 1 },
	update_plugins,
  { type = "padding", val = 1 },
	config_nvim,
  { type = "padding", val = 1 },
	quit,
	{ type = "padding", val = 2 },
	dashboard.section.footer,
}
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
