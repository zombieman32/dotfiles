
require("link-visitor").setup({
  open_cmd = nil,
  --[[ cmd to open url
    defaults:
    win or wsl: cmd.exe /c start
    mac: open
    linux: xdg-open
  --]]
  silent = true, -- disable all prints, `false` by defaults skip_confirmation
  skip_confirmation = false, -- Skip the confirmation step, default: false
  border = "rounded" -- none, single, double, rounded, solid, shadow see `:h nvim_open_win()`
})
