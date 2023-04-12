require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "help", "java",  "javascript", "typescript", "c", "lua", "rust" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

      highlight = {
    -- `false` will disable the whole extension
    enable = true,
    custom_captures = {
        --["@type.qualifier"] = { link = "Keyword" },
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      }
  },
}
-- Set words like 'public' 'private' etc as keyword so it can have the same color as word like 'class' in java
vim.api.nvim_set_hl(0, "@type.qualifier", { link = "Keyword" })
-- 'this.':w:
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "Keyword" })
-- 'return'
vim.api.nvim_set_hl(0, "@keyword.return", { link = "Keyword" })
-- 'import' -> @include
vim.api.nvim_set_hl(0, "@include", { link = "Keyword" })
-- '@annotations' -> @attribute
vim.api.nvim_set_hl(0, "@attribute", { link = "Operator" })
-- 'new' -> @keyword.operator
vim.api.nvim_set_hl(0, "@keyword.operator", { link = "Keyword" })
-- 'throw' 'try' 'catch' -> @exception
vim.api.nvim_set_hl(0, "@exception", { link = "Keyword" })
