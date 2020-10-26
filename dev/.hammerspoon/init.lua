hs.window.animationDuration = 0

local hotkey = require("hs.hotkey")
local mash = {"alt", "shift"}

--- Quickly switch between windows
hotkey.bind(mash, "space", function() hs.hints.windowHints() end)

--- Tiling window management
local tiling = require("hs.tiling")
tiling.set('layouts', {'main-vertical-variable-with-padding', 'fullscreen-with-padding'})
hotkey.bind(mash, "return", tiling.promote)
hotkey.bind(mash, "z",      tiling.retile)
hotkey.bind(mash, "j",      function() tiling.cycle(1) end)
hotkey.bind(mash, "k",      function() tiling.cycle(-1) end)
hotkey.bind(mash, "h",      function() tiling.adjustMainVertical(-0.05) end)
hotkey.bind(mash, "l",      function() tiling.adjustMainVertical(0.05) end)
hotkey.bind(mash, "n",      function() tiling.setPadding(0) end)
hotkey.bind(mash, "p",      function() tiling.setPadding(25) end)
hotkey.bind(mash, "=",      function() tiling.setMainVertical(0.5) end)
hotkey.bind(mash, "v",      function() tiling.goToLayout("main-vertical-variable-with-padding") end)
hotkey.bind(mash, "f",      function()
  tiling.setPadding(100)
  tiling.goToLayout("fullscreen-with-padding")
end)
-- Start up my Vimwiki and my Notes
hotkey.bind(mash, "w", function() hs.task.new("~/bin/wiki", nil):start() end)
hotkey.bind(mash, "m", function() hs.task.new("~/bin/notes", nil):start() end)

hs.window.highlight.ui.overlay = true
hs.window.highlight.ui.overlayColor = {0.2, 0.05, 0, 0.25}
hs.window.highlight.start()
hotkey.bind(mash, "i", function()
  hs.window.highlight.ui.overlay = not hs.window.highlight.ui.overlay
end)

--- Reload configuration automatically
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    hs.alert.show(file)
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.alert.show("Reloading Hammerspoon config...")
    hs.reload()
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Reloading Hammerspoon config...")
