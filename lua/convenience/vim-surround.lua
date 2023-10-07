local status_ok, sr = pcall(require, "nvim-surround")
if not status_ok then
	return
end

sr.setup({})
