vim.cmd [[highlight IndentBlanklineIndent guifg=#C678DD gui=nocombine]]
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

local status_ok, bl = pcall(require, "indent_blankline")
if not status_ok then
    return
end

bl.setup {
    space_char_blankline = " ",
    show_end_of_line = true,
    char_highlight_list = {
        "IndentBlanklineIndent",
    },
}
