-- ~/.config/nvim/lua/plugins/nvim-surround.lua

return {
  'kylechui/nvim-surround',
  version = '*', -- Use latest stable release
  event = 'VeryLazy', -- Lazy-load on keypress
  config = function()
    require('nvim-surround').setup()
  end,
}
-- Optional custom keymaps
-- These mimic mini.surround-style if you prefer
-- Uncomment below if you want to change from `ys`, `ds`, `cs`
-- keymaps = {
--   normal = "sa",
--   delete = "sd",
--   change = "sr",
--   visual = "S",
--   visual_line = "gS",
-- },
