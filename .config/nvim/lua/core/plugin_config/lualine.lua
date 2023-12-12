require('lualine').setup {
    otions = {
        icons_enabled = true,
        theme = 'dracula',
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
