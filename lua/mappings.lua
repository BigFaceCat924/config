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
map('n', '<leader>x', "<cmd>bdelete<CR>", { desc = "Close current buffer" })

-- 窗口切换
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- outline
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle outline" })

-- telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
map('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
map('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
map('n', '<leader>fh', builtin.help_tags, {})

-- 映射 y 复制到系统剪切板
map('n', 'y', '"+y', { noremap = true, silent = true })
map('v', 'y', '"+y', { noremap = true, silent = true })

-- 头文件源文件之间切换
map('n', '<leader>sw', ':CocCommand clangd.switchSourceHeader<CR>',
    { noremap = true, silent = true, desc = "switch source header" })
