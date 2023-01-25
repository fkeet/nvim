local status_ok, module = pcall(require, "neotest")
if not status_ok then
  print "Did not load neotest"
  return
end

module.setup({
  adapters = {
    require('neotest-rspec')({
      rspec_cmd = function()
        return vim.tbl_flatten({
          "bundle",
          "exec",
          "rspec",
        })
      end
    }),
  }
})
