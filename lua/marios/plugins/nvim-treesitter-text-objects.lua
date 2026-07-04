-- nvim-treesitter-textobjects (main branch): no more `configs.setup()`,
-- keymaps are wired directly to the module functions.
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})
vim.g.no_plugin_maps = true

local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")
local swap = require("nvim-treesitter-textobjects.swap")

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
	},
	move = {
		set_jumps = true,
	},
})

local function select_map(keys, query, desc)
	vim.keymap.set({ "x", "o" }, keys, function()
		select.select_textobject(query, "textobjects")
	end, { desc = desc })
end

select_map("a=", "@assignment.outer", "Select outer part of an assignment")
select_map("i=", "@assignment.inner", "Select inner part of an assignment")
select_map("l=", "@assignment.lhs", "Select left hand side of an assignment")
select_map("r=", "@assignment.rhs", "Select right hand side of an assignment")

select_map("a:", "@property.outer", "Select outer part of an object property")
select_map("i:", "@property.inner", "Select inner part of an object property")
select_map("l:", "@property.lhs", "Select left part of an object property")
select_map("r:", "@property.rhs", "Select right part of an object property")

select_map("aa", "@parameter.outer", "Select outer part of a parameter/argument")
select_map("ia", "@parameter.inner", "Select inner part of a parameter/argument")

select_map("ai", "@conditional.outer", "Select outer part of a conditional")
select_map("ii", "@conditional.inner", "Select inner part of a conditional")

select_map("al", "@loop.outer", "Select outer part of a loop")
select_map("il", "@loop.inner", "Select inner part of a loop")

select_map("af", "@call.outer", "Select outer part of a function call")
select_map("if", "@call.inner", "Select inner part of a function call")

select_map("am", "@function.outer", "Select outer part of a method/function definition")
select_map("im", "@function.inner", "Select inner part of a method/function definition")

select_map("ac", "@class.outer", "Select outer part of a class")
select_map("ic", "@class.inner", "Select inner part of a class")

local function move_map(keys, fn, query, desc)
	vim.keymap.set({ "n", "x", "o" }, keys, function()
		fn(query, "textobjects")
	end, { desc = desc })
end

move_map("]f", move.goto_next_start, "@call.outer", "Next function call start")
move_map("]m", move.goto_next_start, "@function.outer", "Next method/function def start")
move_map("]c", move.goto_next_start, "@class.outer", "Next class start")
move_map("]i", move.goto_next_start, "@conditional.outer", "Next conditional start")
move_map("]l", move.goto_next_start, "@loop.outer", "Next loop start")
vim.keymap.set({ "n", "x", "o" }, "]s", function()
	move.goto_next_start("@local.scope", "locals")
end, { desc = "Next scope" })
vim.keymap.set({ "n", "x", "o" }, "]z", function()
	move.goto_next_start("@fold", "folds")
end, { desc = "Next fold" })

move_map("]F", move.goto_next_end, "@call.outer", "Next function call end")
move_map("]M", move.goto_next_end, "@function.outer", "Next method/function def end")
move_map("]C", move.goto_next_end, "@class.outer", "Next class end")
move_map("]I", move.goto_next_end, "@conditional.outer", "Next conditional end")
move_map("]L", move.goto_next_end, "@loop.outer", "Next loop end")

move_map("[f", move.goto_previous_start, "@call.outer", "Prev function call start")
move_map("[m", move.goto_previous_start, "@function.outer", "Prev method/function def start")
move_map("[c", move.goto_previous_start, "@class.outer", "Prev class start")
move_map("[i", move.goto_previous_start, "@conditional.outer", "Prev conditional start")
move_map("[l", move.goto_previous_start, "@loop.outer", "Prev loop start")

move_map("[F", move.goto_previous_end, "@call.outer", "Prev function call end")
move_map("[M", move.goto_previous_end, "@function.outer", "Prev method/function def end")
move_map("[C", move.goto_previous_end, "@class.outer", "Prev class end")
move_map("[I", move.goto_previous_end, "@conditional.outer", "Prev conditional end")
move_map("[L", move.goto_previous_end, "@loop.outer", "Prev loop end")

vim.keymap.set("n", "<leader>na", function()
	swap.swap_next("@parameter.inner")
end, { desc = "Swap parameter/argument with next" })
vim.keymap.set("n", "<leader>n:", function()
	swap.swap_next("@property.outer")
end, { desc = "Swap object property with next" })
vim.keymap.set("n", "<leader>nm", function()
	swap.swap_next("@function.outer")
end, { desc = "Swap function with next" })

vim.keymap.set("n", "<leader>pa", function()
	swap.swap_previous("@parameter.inner")
end, { desc = "Swap parameter/argument with previous" })
vim.keymap.set("n", "<leader>p:", function()
	swap.swap_previous("@property.outer")
end, { desc = "Swap object property with previous" })
vim.keymap.set("n", "<leader>pm", function()
	swap.swap_previous("@function.outer")
end, { desc = "Swap function with previous" })

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
