------------------------------
--NOTE: [***** CP-STUFF *****]|
------------------------------
vim.loader.enable()
vim.opt.number = true
vim.opt.tabstop = 4      
vim.opt.shiftwidth = 4    
vim.opt.expandtab = true   
vim.opt.smartindent = true  
vim.opt.clipboard = 'unnamedplus'
-- Basic-Autocompletion
vim.keymap.set('i', '{', '{}<Left>', { noremap = true })
vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>O', { noremap = true })
vim.keymap.set('i', '{{', '{', { noremap = true })
vim.keymap.set('i', '{}', '{}', { noremap = true })

vim.keymap.set('i', '[', '[]<Left>', { noremap = true })
vim.keymap.set('i', '[<CR>', '[<CR>]<Esc>O', { noremap = true })
vim.keymap.set('i', '[[', '[', { noremap = true })
vim.keymap.set('i', '[]', '[]', { noremap = true })

vim.keymap.set('i', '(', '()<Left>', { noremap = true })
vim.keymap.set('i', '(<CR>', '(<CR>)<Esc>O', { noremap = true })
vim.keymap.set('i', '((', '(', { noremap = true })
vim.keymap.set('i', '()', '()', { noremap = true })

vim.keymap.set('i', '"', '""<Left>', { noremap = true })
vim.keymap.set('i', '""', '"', { noremap = true })
vim.keymap.set('i', '$', function()
 -----------------------------------------
-----NOTE: [***** NON-CP Begins Here *****] |
------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
 vim.api.nvim_put({'$$'}, 'c', true, true)
  vim.api.nvim_input('<Left>')
end, { noremap = true, silent = true })
-- Header configuration
local function insert_cpp_header()
    local date = os.date("%d/%m/%Y")
    local time = os.date("%H:%M:%S")
    local header = {
        string.format('// %s - %s', date, time),
    }
    
    vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
end
vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = "*.cpp",
    callback = function()
        insert_cpp_header()
    end,
})
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]
-- Map <leader>ps to open PowerShell in a horizontal split
vim.api.nvim_set_keymap('n', '<leader>ps', ':vsplit | terminal pwsh<CR>', { noremap = true, silent = true })

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
-- [[ Configure and install plugins ]]
require('lazy').setup({
    {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
   
}, {})
require("luasnip").config.set_config({ -- Setting LuaSnip config
  -- Enable autotriggered snippets
  enable_autosnippets = true,
  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})
require("luasnip.loaders.from_lua").load({paths = "C:/Users/Eyobell/AppData/Local/nvim/LuaSnip"})
