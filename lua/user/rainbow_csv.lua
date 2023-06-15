local status_ok, config = pcall(require, "rainbow_csv")
if not status_ok then
  return
end

config.setup {
  ft = {
    'csv',
    'tsv',
    'csv_semicolon',
    'csv_whitespace',
    'csv_pipe',
    'rfc_csv',
    'rfc_semicolon'
  },
  module = {
    'rainbow_csv',
    'rainbow_csv.fns'
  }
}
