vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    --char = "'▎",
    space_char_blankline = " ",
    --show_current_context = true,
    show_current_context_start = true,
    indent_blankline_use_treesitter = true,
    indent_blankline_strict_tabs = true,
    indent_level = 4,
}
