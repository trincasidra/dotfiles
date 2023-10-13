require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'html',
        'java',
        'javascript',
        'bash',
        'lua',
        'vim',
        'json',
        'python',
        'haskell',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
