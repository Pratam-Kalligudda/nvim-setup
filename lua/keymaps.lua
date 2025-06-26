-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- NORMAL mode: Move current line up/down with Alt+Arrow
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down', silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up', silent = true })

-- VISUAL mode: Move selected block up/down with Alt+Arrow
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move block down', silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move block up', silent = true })

vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Move line down', silent = true })
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Move line up', silent = true })

-- VISUAL mode: Move selected block up/down with Alt+Arrow
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move block down', silent = true })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move block up', silent = true })
--
vim.keymap.set('n', '<S-Up>', 'Vk', { noremap = true, desc = 'Visual select up' })
vim.keymap.set('n', '<S-Down>', 'Vj', { noremap = true, desc = 'Visual select down' })
vim.keymap.set('v', '<S-Up>', 'k', { noremap = true, desc = 'Extend selection up' })
vim.keymap.set('v', '<S-Down>', 'j', { noremap = true, desc = 'Extend selection down' })

vim.keymap.set('n', '<S-k>', 'Vk', { noremap = true, desc = 'Visual select up' })
vim.keymap.set('n', '<S-j>', 'Vj', { noremap = true, desc = 'Visual select down' })
vim.keymap.set('v', '<S-k>', 'k', { noremap = true, desc = 'Extend selection up' })
vim.keymap.set('v', '<S-j>', 'j', { noremap = true, desc = 'Extend selection down' })

-- Duplicate selection or current line down
vim.keymap.set({ 'n', 'v' }, '<A-S-j>', function()
  if vim.fn.mode() == 'v' then
    -- Duplicate selected lines below
    vim.cmd 'normal! y`>p'
    vim.cmd 'normal! gv'
  else
    -- Duplicate current line below
    vim.cmd 'normal! Yp'
  end
end, { desc = 'Duplicate line/selection down' })

-- Duplicate selection or current line up
vim.keymap.set({ 'n', 'v' }, '<A-S-k>', function()
  if vim.fn.mode() == 'v' then
    -- Duplicate selected lines above
    vim.cmd 'normal! y`<P'
    vim.cmd 'normal! gv'
  else
    -- Duplicate current line above
    vim.cmd 'normal! YP'
  end
end, { desc = 'Duplicate line/selection up' })
