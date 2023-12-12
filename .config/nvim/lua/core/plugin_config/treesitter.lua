require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'apex',
        'bash',
        'css',
        'haskell',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'vim',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
