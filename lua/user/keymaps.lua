local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Explore window
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Misc
keymap("n", "<leader>fq", ":q<cr>", opts)
keymap("n", "<leader>fa", "<cmd>SessionSave<cr><cmd>wqa<cr>", opts)
keymap("n", "<leader>v", "<c-w>v", opts)
keymap("n", "<leader>h", "<c-w>s", opts)
keymap("n", "<leader>n", ":nohl<cr>", opts)
keymap("n", "<leader>.", "\"+y", opts)
keymap("v", "<leader>.", "\"+y", opts)
keymap("n", "<leader> ", "<cmd>wa<cr>", opts)
keymap("n", "<leader>do", "<cmd>diffoff<cr>", opts)
vim.keymap.set('n', '<leader>fu', require('undotree').toggle, opts)

-- Easy escape
keymap("i", "jj", "<esc>", opts)

keymap(
  "n",
  "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_cursor({ previewer = false }))<cr>",
  opts
)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope persisted theme=cursor<cr>", opts)
keymap("n", "<leader>f*", "<cmd>Telescope grep_string<cr>", opts)
keymap("v", "<leader>f*", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)

keymap("n", "<leader>s", "<cmd>:Git<cr>", opts)
keymap("n", "<leader>fp", ":Format<cr>", opts)
keymap("v", "<leader>fp", ":Format<cr>", opts)
keymap("n", "<leader>tn", ":tabnew<cr>", opts)
keymap("n", "<leader>tc", "<cmd>w<cr><cmd>tabclose<cr>", opts)
keymap(
  "n",
  "<leader>bh",
  ":lua require('close_buffers').delete({type = 'hidden'})<CR>",
  opts
)

-- Testing
vim.keymap.set("n", "<leader>ft", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
vim.keymap.set("n", "<leader>fi", "<cmd>w<cr> <cmd>lua require('neotest').run.run()<cr>", opts)

-- Code outline
vim.keymap.set("n", "<leader>fo", "<cmd>SymbolsOutline<cr>", opts)
