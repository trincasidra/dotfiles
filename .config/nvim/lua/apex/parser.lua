local parser_config = require ('nvim-treesitter.parsers').get_parser_configs()
parser_config.apex = {
  install_info = {
    url = '~/.apex/tree-sitter-sfapex/apex', -- local path or git repo
    files = {'src/parser.c'}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}

parser_config.soql = {
  install_info = {
    url = '~/.apex/tree-sitter-sfapex/soql', -- local path or git repo
    files = {'src/parser.c'}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}

parser_config.sosl = {
  install_info = {
    url = '~/.apex/tree-sitter-sfapex/sosl', -- local path or git repo
    files = {'src/parser.c'}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}

vim.treesitter.language.register('apex', 'apex')
vim.treesitter.language.register('apex', 'cls')
vim.treesitter.language.register('apex', 'trigger')
