require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up(n)" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down(n)" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up(v)" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down(v)" })

map("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Toggle Undotree" })

map(
  "n",
  "<leader>ti",
  "<CMD>Telescope lsp_implementations<CR>",
  { desc = "List interface implementation(s) in Telescope" }
)

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true, desc = "Copilot Accecpt" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
