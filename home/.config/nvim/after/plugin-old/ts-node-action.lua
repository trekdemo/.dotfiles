local swap_quotes = function(node)
  local helpers = require("ts-node-action.helpers")
  local text = helpers.node_text(node)
  local wrapped = string.gsub(text, [[(["'])]], function (s)
    if s == "'" then
      return '"'
    elseif s == '"' then
      return "'"
    end
  end)

  return {wrapped}
end

require("ts-node-action").setup({
  ruby = {
    ["string"] = swap_quotes
  },
})

vim.keymap.set('n', "T", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
