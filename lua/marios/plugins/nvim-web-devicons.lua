return {
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
    },

    {
      "nvim-tree/nvim-web-devicons",
       config = function()
        require("nvim-web-devicons").set_icon({
          gql = {
            icon = "",
            color = "#e535ab",
            cterm_color = "199",
            name = "GraphQL",
          },
        })
      end,
    }
}
