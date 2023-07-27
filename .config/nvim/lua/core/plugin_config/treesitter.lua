require('apex.parser')
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'apex',
        'soql',
        'sosl',
        'html',
        'java',
        'javascript',
        'bash',
        'lua',
        'vim',
        'json',
        'python',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
