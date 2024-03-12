require("nvim-treesitter.configs").setup({
    ensure_installed = {"css", "gleam", "go", "html", "javascript", "lua", "typescript", "vim"},
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true
    }
})
