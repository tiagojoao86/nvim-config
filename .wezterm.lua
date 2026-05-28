-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("JetBrainsMono NF")
config.window_background_opacity = 0.80
config.scrollback_lines = 10000

config.leader = { key = "a", mods = "CTRL" }

config.keys = {
	{ key = "h", mods = "LEADER", action = wezterm.action.SplitHorizontal },
	{ key = "v", mods = "LEADER", action = wezterm.action.SplitVertical },
	{ key = "LeftArrow", mods = "CTRL|SUPER", action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
	{ key = "RightArrow", mods = "CTRL|SUPER", action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },
	{ key = "UpArrow", mods = "CTRL|SUPER", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "CTRL|SUPER", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },

	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			-- 1. Divide horizontalmente: cria um painel à direita que ocupa 30% da tela total
			local direita = pane:split({
				direction = "Right",
				size = 0.7,
			})
			-- 2. Divide verticalmente o painel original da esquerda:
			-- cria um painel abaixo dele que ocupa 40% do espaço da esquerda
			direita:split({
				direction = "Bottom",
				size = 0.2,
			})
		end),
	},
}

wezterm.on("window-config-reloaded", function(window, pane)
	-- Maximiza a janela atual imediatamente
	window:maximize()
end)

-- Finally, return the configuration to wezterm:
return config
