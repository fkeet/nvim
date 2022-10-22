local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer. Close and reopen neovim"
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reload neovim when you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Protected call so we don't break on first call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Set packer to use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}

-- Install plugins
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- packer manages itself
    use "nvim-lua/popup.nvim" -- lib for popup ability in packer
    use "nvim-lua/plenary.nvim" -- common lib for neovim plugins

    -- Colorschemes
    use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"
    use 'sunjon/shade.nvim'

    -- Completion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple language server installer

    -- Telescope
    use "nvim-telescope/telescope.nvim" -- fuzzy finder
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Misc
    use "Shatur/neovim-session-manager"
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentString"
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      --run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }
    use "p00f/nvim-ts-rainbow"

    -- Statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- GitSigngs
    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('gitsigns').setup {} end
    }

    -- Automatically set up config after cloning
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
end)
