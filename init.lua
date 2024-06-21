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

-- 禁用鼠标
vim.opt.mouse = ""

-- 启用语法高亮
vim.cmd('syntax on')
vim.cmd('filetype plugin on')

-- 使用系统剪切板
vim.opt.clipboard:append('unnamedplus')

-- 加载插件
require("plugins")

-- 加载coc配置
require("configs.coc")

-- 配置主题
vim.cmd [[colorscheme gruvbox]]

-- 配置 coc.nvim
vim.g.coc_global_extensions = {
    'coc-clangd',  -- Clangd support
    'coc-json',    -- JSON support
    'coc-pyright', -- Python support
    'coc-marketplace',
    'coc-snippets',
    'coc-lua',
}

-- 检测是否通过 SSH 登录
local function is_ssh()
    return vim.loop.os_getenv("SSH_CLIENT") ~= nil or
        vim.loop.os_getenv("SSH_TTY") ~= nil or
        vim.loop.os_getenv("SSH_CONNECTION") ~= nil
end

if is_ssh() then
    -- 如果是远程登录，则设置ssh剪切板互通
    vim.g.clipboard = {
        name = 'Lemonade',
        copy = {
            ['+'] = 'lemonade copy',
            ['*'] = 'lemonade copy',
        },
        paste = {
            ['+'] = 'lemonade paste',
            ['*'] = 'lemonade paste',
        },
        cache_enabled = 0,
    }
end
-- 加载快捷键配置
require("mappings")
