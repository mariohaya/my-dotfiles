----------- Initialize Packer -----------
require('packer').startup(function(use)
end)

----------- Custom Keybinds -----------
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.keymap.set('n', 'a', 'I', { noremap = true })
vim.keymap.set('n', 'I', 'a', { noremap = true })

----------- Custom configs -----------
vim.o.clipboard = "unnamedplus" -- Yanking to Clipboard (Wayland)
vim.g.clipboard = {
    name = "wl-clipboard", 
    copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
    paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
    cache_enabled = 1,}

-- Yank directory \+d
vim.keymap.set('n', '\\d', function()
  vim.fn.setreg('+', vim.fn.expand('%:p:h'))
  print('Directory copied to clipboard')
end, { desc = 'Copy current file directory to clipboard' })
-- Yank entire file \+y
vim.keymap.set('n', '\\y', function()
  vim.cmd('normal! gg"+yG')
  print('Entire file copied to clipboard')
end, { desc = 'Yank entire file to clipboard' })

----------- LaTeX compiler -----------
vim.g.mapleader = "\\" -- Set the leader key to backslash (\)
vim.api.nvim_create_user_command('CompileLatex', function()
  vim.cmd('w')  -- Save current file first
  local filename = vim.fn.expand('%')  -- Get the current file's name
  vim.fn.system('mkdir -p build')  -- Create the 'build' directory 
  vim.cmd('!' .. 'latexmk -pdf -outdir=build ' .. filename) -- runs latexmk to compile
end, {})
vim.api.nvim_set_keymap('n', '<leader>l', ':CompileLatex<CR>', { noremap = true, silent = true }) -- Bind the custom command to \+p

----------- Visuals -----------
vim.o.termguicolors = true  -- Enable true color support
vim.wo.number = true -- Enable line numbers
vim.o.statusline = "%F %m" -- Shows filename
vim.cmd("colorscheme gruvbox") -- theme
vim.cmd([[
  highlight StatusLine guifg=#FFA500 guibg=#005f87 
  highlight StatusLineNC guifg=#FFA500 guibg=#303030]]) -- transparent bg
 vim.cmd('highlight Normal guibg=NONE') -- normal text bg 
 vim.cmd('highlight NonText guibg=NONE') -- non-text 
 vim.cmd('highlight LineNr guibg=NONE') -- line no.
 vim.cmd('highlight StatusLine guibg=NONE') -- status line bg
 vim.cmd('highlight TabLine guibg=NONE') -- tab line bg
