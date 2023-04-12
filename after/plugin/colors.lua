vim.opt.laststatus = 2 -- Or 3 for global statusline
vim.opt.statusline = " %f %m %= %l:%c ♥ "

require('rose-pine').setup({
    dark_variant = 'main',
    disable_background = true,
    highlight_groups = {
        ColorColumn = { bg = 'rose' },
		StatusLine = { fg = "love", bg = "love", blend = 10 },
		StatusLineNC = { fg = "subtle", bg = "surface" },
        -- Telescope transparent background
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	},
})

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()

-- Get wave variant colors
local wave_colors = require("kanagawa.colors").setup({ theme = 'wave' })
local palette = wave_colors.palette

-- THEME KANAGAWA
-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {
            --Selection text color
            waveBlue1 = "#2B2D6E",
            --waveAqua2 = "#8178cc"
        },
        theme = {
            dragon = {
                ui = {
                    pmenu      = {
                        fg       = palette.fujiWhite,
                        fg_sel   = "none",
                        bg       = palette.waveBlue1,
                        bg_sel   = "#9ba7d1",
                        bg_thumb = palette.waveBlue2,
                        bg_sbar  = palette.waveBlue1,
                    },
                },
                --Replace colors of dragon theme using wave theme, and keep background/ui of dragon
                syn = {
                    string     = palette.springGreen,
                    variable   = "none",
                    number     = palette.sakuraPink,
                    --Annotations java
                    constant   = "#E8A561",
                    identifier = palette.carpYellow,
                    parameter  = "#ffffff",
                    fun        = '#ffffff',
                    statement  = palette.oniViolet,
                    keyword    = palette.oniViolet,
                    operator   = '#de941d',
                    preproc    = palette.waveRed, --lightBlue? deserves its own color
                    type       = "#ffffff",
                    regex      = palette.boatYellow2,
                    deprecated = palette.katanaGray,
                    comment    = palette.fujiGray,
                    punct      = palette.springViolet2,
                    special1   = palette.springBlue,
                    special2   = palette.waveRed,
                    special3   = palette.peachRed,
                }
            },
            all = {} },

    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            --Transparent floating windows
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            --Telescope borderless
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

