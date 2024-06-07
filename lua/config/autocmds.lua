-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- in dutch lang jk is used, so when making notes I want to fall back to ESC
vim.api.nvim_create_user_command("CMode", function()
  vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
end, {})

-- back to code mode
vim.api.nvim_create_user_command("MMode", function()
  vim.api.nvim_del_keymap("i", "jk")
end, {})

local pick = require("telescope.pickers")
local find = require("telescope.finders")
local sort = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
vim.api.nvim_create_user_command("BS", function()
  local opts = {
    finder = find.new_table({ "json", "go", "markdown", "javascript", "typescript", "html", "xml", "cypher" }),
    sorter = sort.get_generic_fuzzy_sorter({}),
  }

  pick
    .new(opts, {
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.bo.filetype = selection.value
        end)
        return true
      end,
    })
    :find()
end, {})

local build_commands = {
  go = "go build",
}

local debug_build_commands = {
  go = "go build",
}

local run_commands = {
  go = "go run .",
}

vim.api.nvim_create_user_command("Build", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(build_commands) do
    if filetype == file then
      vim.cmd("!" .. command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("DebugBuild", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(debug_build_commands) do
    if filetype == file then
      vim.cmd("!" .. command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Run", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(run_commands) do
    if filetype == file then
      vim.cmd("sp")
      vim.cmd("term " .. command)
      vim.cmd("resize 20N")
      local keys = vim.api.nvim_replace_termcodes("i", true, false, true)
      vim.api.nvim_feedkeys(keys, "n", false)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Config", function()
  vim.cmd([[cd ~/.config/nvim]])
end, {})

vim.api.nvim_create_user_command("UpdateAll", function()
  vim.cmd([[TSUpdateSync]])
  vim.cmd([[MasonUpdate]])
end, {})

local function getWords()
  if vim.fn.getfsize(vim.fn.expand("%")) > 200000 then
    return ""
  end

  if vim.fn.wordcount().visual_words == 1 then
    return "1 word"
  elseif not (vim.fn.wordcount().visual_words == nil) then
    return tostring(vim.fn.wordcount().visual_words) .. " words"
  else
    if vim.fn.wordcount().words == 1 then
      return "1 word"
    else
      return tostring(vim.fn.wordcount().words) .. " words"
    end
  end
end

local wordCountOn = false

vim.api.nvim_create_user_command("WordCount", function()
  if wordCountOn then
    require("lualine").setup({
      sections = {
        lualine_c = { "filename" },
      },
    })
    wordCountOn = true
  else
    require("lualine").setup({
      sections = {
        lualine_c = { "filename", { getWords } },
      },
    })
    wordCountOn = true
  end
end, {})
