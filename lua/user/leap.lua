local status_ok, configs = pcall(require, 'leap')
if not status_ok then
  print "Did not load leap"
  return
end

configs.add_default_mappings()
