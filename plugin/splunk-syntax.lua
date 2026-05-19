local function set_hl()
  vim.api.nvim_set_hl(0, 'splunkPipe', { fg = '#ff922f' })
end

set_hl()

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('SplunkSyntaxHL', { clear = true }),
  callback = set_hl,
})
