
require'telescope'.load_extension('make')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', ';f', builtin.find_files, {})
vim.keymap.set('n', ';d', builtin.git_files, {})
-- Rip grep commands
vim.keymap.set('n', ';g', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', ';r', builtin.live_grep, {})
-- Buffer
vim.keymap.set('n', '\\\\', builtin.live_grep, {})

-- LSP commands
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_incoming_calls<cr>")
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>")
-- Make file commands
vim.keymap.set("n", '<leader>mk', "<cmd>Telescope make<cr>")

local status, telescope = pcall(require, "telescope")
telescope.load_extension("file_browser")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup({
    --shorten_path=true,
    defaults = {
        path_display = { "smart" },
       layout_strategy = 'horizontal',
       layout_config = {
           width = 165,
       },
     },
    pickers = {
        lsp_references = {
            layout_strategy = "vertical",
            layout_config = {
                height = 0.5,
            },
        }
  },
  extensions = {
      file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
              -- your custom insert mode mappings
              ["i"] = {
                  ["<C-w>"] = function() vim.cmd('normal vbd') end,
              },
              ["n"] = {
                  -- your custom normal mode mappings
                  ["c"] = fb_actions.create,
                  ["h"] = fb_actions.goto_parent_dir,
                  ["/"] = function()
                      vim.cmd('startinsert')
                  end
              },
          },
      },
  },
})

