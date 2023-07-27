require('lualine').setup {
    otions = {
        icons_enabled = true,
        theme = 'gruvbox',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
