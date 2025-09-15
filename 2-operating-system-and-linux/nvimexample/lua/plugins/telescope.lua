return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- Set up theme
    require('telescope').setup {
      pickers = {
        find_files = {
          theme = "ivy"
        }
      }
    }
    -- Find help, search help
    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
    -- Find files in cwd
    vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
    -- Editor Neovim configuration
    vim.keymap.set("n", "<space>en", function()
      -- Set ivy theme for this call
      local opts = require('telescope.themes').get_ivy({
        cwd = vim.fn.stdpath("config")
      })
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
  end
}
