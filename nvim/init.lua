----- Custom Commands
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})

----- Misc. configs
-- Enable line numbers
vim.wo.number = true
-- Set the leader key to space
vim.g.mapleader = ' '
-- Example of setting an option
vim.o.hlsearch = false
-- Yanking to Clipboard 
vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
    paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
    cache_enabled = 1,
}

----- LaTeX compile
-- Set the leader key to backslash (\)
vim.g.mapleader = "\\"  -- This sets the leader key to backslash

-- Define a custom command to compile the current LaTeX file using pdflatex
vim.api.nvim_create_user_command('CompileLatex', function()
  -- Save current file first
  vim.cmd('w')

  -- Get the current file's name
  local filename = vim.fn.expand('%')
  
  -- Run pdflatex to compile the LaTeX file
  vim.cmd('!' .. 'pdflatex ' .. filename)
end, {})

-- Bind the custom command to a key (e.g., <leader>c)
vim.api.nvim_set_keymap('n', '<leader>c', ':CompileLatex<CR>', { noremap = true, silent = true })

--------- COLORS
vim.o.termguicolors = true  -- Enable true color support
-- Make the background of Neovim transparent
vim.cmd('highlight Normal guibg=NONE')  -- Set the background of normal text to transparent
vim.cmd('highlight NonText guibg=NONE')  -- Set non-text elements (e.g., trailing spaces) transparent
vim.cmd('highlight LineNr guibg=NONE')  -- Set line number background transparent
vim.cmd('highlight StatusLine guibg=NONE')  -- Set status line background transparent
vim.cmd('highlight TabLine guibg=NONE')  -- Set tab line background transparent
