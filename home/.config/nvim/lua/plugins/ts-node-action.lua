-- TODO: Insert the link reference after the current paragraph
-- TODO: Ensure that the reference id is unique in the document
local function convert_inline_link_to_reference(node)
  local helpers = require 'ts-node-action.helpers'
  local components = helpers.destructure_node(node)
  local id = 1

  return {
    '[' .. components.link_text .. '][' .. id .. ']',
    '[' .. id .. ']: ' .. components.link_destination,
  }
end

-- TODO: Grab the actual link_destination for the reference
local function convert_reference_to_inline_link(node)
  local helpers = require 'ts-node-action.helpers'
  local components = helpers.destructure_node(node)
  local link_destination = components.link_label:gsub('[%[%]]', { ['['] = '', [']'] = '' })

  return '[' .. components.link_text .. '](' .. link_destination .. ')'
end

return {
  'CKolkey/ts-node-action',
  keys = {
    { '<leader>tr', '<cmd>NodeAction<CR>', desc = 'Trigger node action' },
  },
  opts = {
    markdown_inline = {
      ['inline_link'] = convert_inline_link_to_reference,
      ['full_reference_link'] = convert_reference_to_inline_link,
    },
  },
}
