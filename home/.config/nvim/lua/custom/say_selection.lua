local M = {}

function M.say_selected_text()
  local mode = vim.fn.mode()
  local selected_text = ""

  if mode == 'v' or mode == 'V' or mode == '' then
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    local start_row = start_pos[2]
    local start_col = start_pos[3]
    local end_row = end_pos[2]
    local end_col = end_pos[3]

    if mode == 'V' then
      local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
      selected_text = table.concat(lines, " ")
    elseif mode == '' then
      local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
      for i, line in ipairs(lines) do
        if i == 1 and i == #lines then
          selected_text = string.sub(line, start_col, end_col)
        elseif i == 1 then
          selected_text = string.sub(line, start_col)
        elseif i == #lines then
          selected_text = selected_text .. " " .. string.sub(line, 1, end_col)
        else
          selected_text = selected_text .. " " .. line
        end
      end
    else
      local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
      for i, line in ipairs(lines) do
        if i == 1 and i == #lines then
          selected_text = string.sub(line, start_col, end_col)
        elseif i == 1 then
          selected_text = string.sub(line, start_col)
        elseif i == #lines then
          selected_text = selected_text .. " " .. string.sub(line, 1, end_col)
        else
          selected_text = selected_text .. " " .. line
        end
      end
    end
  else
    print("No text selected")
    return
  end

  if selected_text == "" then
    print("No text selected")
    return
  end

  selected_text = selected_text:gsub("'", "'\\''")

  local cmd = string.format("say '%s'", selected_text)
  vim.fn.system(cmd)

  print("Speaking selected text...")
end

vim.api.nvim_create_user_command('SaySelection', M.say_selected_text, { range = true })

vim.keymap.set('v', '<leader>s', M.say_selected_text, { desc = 'Say selected text' })

return M