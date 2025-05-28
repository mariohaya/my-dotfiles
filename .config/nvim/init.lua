----------- Auto-install Packer -----------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

----------- Initialize Packer -----------
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'Vallen217/eidolon.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

----------- Custom Keybinds -----------
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.keymap.set('n', 'a', 'I', { noremap = true })
vim.keymap.set('n', 'I', 'a', { noremap = true })

----------- Clipboard Setup -----------
vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "wl-clipboard", 
  copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
  paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
  cache_enabled = 1,
}

----------- Yank Shortcuts -----------
vim.keymap.set('n', '\\d', function()
  vim.fn.setreg('+', vim.fn.expand('%:p:h'))
  print('Directory copied to clipboard')
end, { desc = 'Copy current file directory to clipboard' })

vim.keymap.set('n', '\\y', function()
  vim.cmd('normal! gg"+yG')
  print('Entire file copied to clipboard')
end, { desc = 'Yank entire file to clipboard' })

----------- LaTeX Compiler -----------
vim.g.mapleader = "\\"
vim.api.nvim_create_user_command('CompileLatex', function()
  vim.cmd('w')
  local filename = vim.fn.expand('%')
  vim.fn.system('mkdir -p build')
  vim.cmd('!' .. 'latexmk -xelatex -outdir=build ' .. filename)
end, {})

vim.api.nvim_set_keymap('n', '<leader>l', ':CompileLatex<CR>', { noremap = true, silent = true })

----------- Visual Settings -----------
vim.o.termguicolors = true
vim.wo.number = true
vim.o.statusline = "%F %m"


-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme eidolon")

vim.cmd('highlight Normal guibg=NONE') -- normal text bg 
vim.cmd('highlight NonText guibg=NONE') -- non-text 
vim.cmd('highlight LineNr guibg=NONE') -- line no.
vim.cmd('highlight StatusLine guibg=NONE guifg=#FFA500') -- status line bg
vim.cmd('highlight TabLine guibg=NONE') -- tab line bg
vim.cmd('highlight Special guibg=NONE')
vim.cmd('highlight Comment guibg=NONE')
vim.cmd('highlight EndOfBuffer guibg=NONE')

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }  -- Set language; can add more like 'en_gb', 'es', etc.
