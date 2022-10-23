local status_ok, configs = pcall(require, 'shade')
if not status_ok then
  print "Did not load shade"
  return
end

configs.setup ({
  overlay_opacity = 70,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>d',
  }
})
