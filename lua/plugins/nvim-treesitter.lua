require'nvim-treesitter.configs'.setup {
  -- 支持的语言
  ensure_installed = {
      "c",
      "cpp",
      "go",
      "rust",
      "lua",
      "vim",
      "bash",
      "javascript",
      "json",
      "python",
      "make",
      "cmake",
      "help",
  },

  highlight = {
      enable = true
  },

  indent = {
      enable = true,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
