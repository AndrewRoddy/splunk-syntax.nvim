local function is_splunk_xml(bufnr)
  for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
    if line:match('<dashboard[%s/>]') or line:match('<form[%s/>]') then
      return true
    end
  end
  return false
end

vim.filetype.add({
  extension = {
    spl = 'splunk',
    splunk = function(_, bufnr)
      return is_splunk_xml(bufnr) and 'splunkxml' or 'splunk'
    end,
  },
  pattern = {
    ['.*%.xml'] = function(_, bufnr)
      if is_splunk_xml(bufnr) then
        return 'splunkxml'
      end
    end,
  },
})
