-- TODO: keymap <leader>ca should call this plugin by default
return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    config = function()
        require('tiny-code-action').setup()
        vim.keymap.set("n", "<leader>cP", function()
            require("tiny-code-action").code_action()
        end, { noremap = true, silent = true })
    end
}
