local util = require 'lspconfig.util'
local cmd = { 'ruby-lsp' }

return {
  default_config = {
    cmd = cmd,
    filetypes = { 'ruby' },
    root_dir = util.root_pattern('Gemfile', '.git'),
    init_options = {
      enabledFeatures = {
        'codeActions',
        'diagnostics',
        'documentHighlights',
        'documentSymbols',
        'formatting',
        'inlayHint',
      },
    },
  },
  docs = {
    description = [[
https://shopify.github.io/ruby-lsp/
This gem is an implementation of the language server protocol specification for
Ruby, used to improve editor features.
Install the gem. There's no need to require it, since the server is used as a
standalone executable.
```sh
group :development do
  gem "ruby-lsp", require: false
end
```
    ]],
    default_config = {
      root_dir = [[root_pattern("Gemfile", ".git")]],
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}
