-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
--
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<C-\>]],
      direction = 'float', -- or 'horizontal' | 'vertical' | 'tab'
      float_opts = {
        border = 'curved',
        winblend = 3,
      },
    }

    -- Optional mappings
    vim.keymap.set('n', '<leader>tt', function()
      require('toggleterm').toggle()
    end, { desc = 'Toggle Terminal' })
  end,
}
