-- 动态加载 configs 目录下的所有 Lua 文件
local config_path = vim.fn.stdpath('config') .. '/configs/'
local files = vim.fn.glob(config_path .. '*.lua', true, true)
for _, file in ipairs(files) do
    local module = file:sub(#config_path + 1, -5)
    require('configs.' .. module)
end
-- 自动安装lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")
require("configs.coc")

-- 配置主题
vim.cmd [[colorscheme tokyonight]]

-- 配置tab等于4个空格
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spacesin tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- 设置 leader 键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 显示行号
vim.wo.number = true

-- 启用语法高亮
vim.cmd('syntax on')
vim.cmd('filetype plugin on')

-- 使用系统剪切板
vim.opt.clipboard:append('unnamedplus')

require("mappings")


