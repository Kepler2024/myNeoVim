return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_port = "8089"
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_browserfunc = "OpenInIterm"
    vim.cmd([[
      function! OpenInIterm(url)
        let html = '<!DOCTYPE html><meta http-equiv="refresh" content="0; url=' . a:url . '">'
        call writefile([html], expand('~/iterm-mdpreview.html'))
      endfunction
    ]])
  end,
  ft = { "markdown" },
}
