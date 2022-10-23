local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 1000,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    cursorcolumn = true,
    number = false,
    relativenumber = false,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = true,
    scrolloff = 8,
    sidescrolloff = 8,
    guifont = "monospace:h17",
    list = true,
    --nostartofline = true,
}

vim.opt.shortmess:append "c"
--vim.opt.listchars = { tab = "", trail = "", extends = "»", precedes = "«", nbsp = "×" }
--vim.opt.listchars:append { tab = "▸" }
vim.opt.listchars = {
  trail = '·',
  extends = '»',
  precedes = '«',
  nbsp= '×',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
