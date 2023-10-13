require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'html',
        'lua_ls',
        'haskell',
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspsaga').setup({
    code_action_icon = "💡",
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = ' ',
        show_file = true,
        file_formatter = ""
    },
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

nvim_lsp.html.setup{}

nvim_lsp.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
