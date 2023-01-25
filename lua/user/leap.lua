local status_ok, configs = pcall(require, 'leap')
if not status_ok then
  print "Did not load leap"
  return
end

for _, _1_ in ipairs({{{"n", "x", "o"}, "s", "<Plug>(leap-forward-to)"}, {{"n", "x", "o"}, "S", "<Plug>(leap-backward-to)"}, {{"n", "x", "o"}, "gs", "<Plug>(leap-cross-window)"}}) do
  local _each_2_ = _1_
  local modes = _each_2_[1]
  local lhs = _each_2_[2]
  local rhs = _each_2_[3]
  for _, mode in ipairs(modes) do
    if ((vim.fn.mapcheck(lhs, mode) == "") and (vim.fn.hasmapto(rhs, mode) == 0)) then
      vim.keymap.set(mode, lhs, rhs, {silent = true})
    else
    end
  end
end
