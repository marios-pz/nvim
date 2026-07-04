---@brief
---
--- https://github.com/aca/emmet-ls
---
--- Package can be installed via `npm`:
--- ```sh
--- npm install -g emmet-ls
--- ```

---@type vim.lsp.Config
return {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
  root_markers = { '.git' },
}
