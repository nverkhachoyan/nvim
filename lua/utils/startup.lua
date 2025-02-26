-- Create this as a new file in your neovim config, e.g., 'lua/custom-startup.lua'

local M = {}

-- Your ASCII art
local ascii_art = {

  [[                                                             ]],
  [[<-. (`-')_  (`-')  _                 (`-')  _     <-. (`-')  ]],
  [[   \( OO) ) ( OO).-/     .->        _(OO ) (_)       \(OO )_ ]],
  [[,--./ ,--/ (,------.(`-')----. ,--.(_/,-.\ ,-(`-'),--./  ,-.)]],
  [[|   \ |  |  |  .---'( OO).-.  '\   \ / (_/ | ( OO)|   `.'   |]],
  [[|  . '|  |)(|  '--. ( _) | |  | \   /   /  |  |  )|  |'.'|  |]],
  [[|  |\    |  |  .--'  \|  |)|  |_ \     /_)(|  |_/ |  |   |  |]],
  [[|  | \   |  |  `---.  '  '-'  '\-'\   /    |  |'->|  |   |  |]],
  [[`--'  `--'  `------'   `-----'     `-'     `--'   `--'   `--']]
}

-- local ascii_art = {
--   [[                                                                     ]],
--   [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗              ]],
--   [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║              ]],
--   [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║              ]],
--   [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║              ]],
--   [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║              ]],
--   [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝              ]],
--   [[                                                                     ]],
-- }

-- Function to create a centered buffer
function M.create_centered_buffer()
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Get editor width and height
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- Calculate ascii art dimensions
  local ascii_width = #ascii_art[1]
  local ascii_height = #ascii_art

  -- Calculate starting positions for centering
  local row = math.floor((height - ascii_height) / 2) - 1
  local col = math.floor((width - ascii_width) / 2)

  -- Create empty lines for padding
  local top_padding = {}
  for _ = 1, row do
    table.insert(top_padding, "")
  end

  -- Center each line of ASCII art horizontally
  local centered_ascii = {}
  for _, line in ipairs(ascii_art) do
    local padding = string.rep(" ", col)
    table.insert(centered_ascii, padding .. line)
  end

  -- Combine padding and centered ASCII art
  local final_text = vim.list_extend(top_padding, centered_ascii)

  -- Set buffer content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, final_text)

  -- Set buffer options
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'modified', false)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- Return the buffer number
  return buf
end

-- Function to open the startup screen
function M.open_startup_screen()
  -- Create and display the buffer
  local buf = M.create_centered_buffer()
  vim.api.nvim_set_current_buf(buf)

  -- Hide UI elements
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.opt.ruler = false
  vim.opt.laststatus = 0
  vim.opt.showcmd = false
  vim.opt.fillchars = { eob = " " }

  -- Add autocmd to restore UI elements when leaving this buffer
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = buf,
    callback = function()
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.ruler = true
      vim.opt.laststatus = 2
      vim.opt.showcmd = true
      vim.opt.fillchars = { eob = "~" }
    end,
    once = true
  })

  -- Add keymaps for quick actions
  local opts = { noremap = true, silent = true, buffer = buf }
  vim.keymap.set('n', 'q', ':q<CR>', opts)
  vim.keymap.set('n', '<CR>', ':enew<CR>', opts)
end

return M
