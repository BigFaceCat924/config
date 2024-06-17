local map = vim.keymap.set

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { silent = true })

-- buffer切换
map('n', '<Tab>', ':BufferLineCycleNext<CR>', {
    noremap = true,
    silent = true,
    desc = "buffer goto next"
})
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {
    noremap = true,
    silent = true,
    desc = "buffer goto prev"
})

-- 窗口切换
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- coc
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
map("n", "gd", "<Plug>(coc-definition)", { silent = true, desc = "Go to definition" })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true, desc = "Go to type definition" })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true, desc = "Go to implementation" })
map("n", "gr", "<Plug>(coc-references)", { silent = true, desc = "Go to references" })
map("n", "<leader>rn", "<Plug>(coc-renane)", { silent = true, desc = "rename" })
map("x", "<leader>fm", "<Plug>(coc-format-selected)", { silent = true, desc = "format selected code" })
map("n", "<leader>fm", "<Plug>(coc-format-selected)", { silent = true, desc = "format selected code" })
map("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true, nowait = true, desc = "quick fix" })
map("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
map("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- outline
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle outline" })

-- telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})

-- 映射 y 复制到系统剪切板
map('n', 'y', '"+y', { noremap = true, silent = true })
map('v', 'y', '"+y', { noremap = true, silent = true })
