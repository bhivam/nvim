{ pkgs, ... }:

let
  treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.lua
    p.vim
    p.vimdoc
    p.c
    p.query
    p.typescript
    p.javascript
    p.tsx
    p.go
    p.rust
    p.nix
    p.json
    p.html
    p.css
    p.markdown
    p.markdown_inline
  ]);
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      # Colorscheme
      catppuccin-nvim

      # Formatter
      guard-nvim
      guard-collection

      # Completion
      nvim-cmp
      cmp-nvim-lsp

      # LSP
      nvim-lspconfig

      # UI
      lualine-nvim
      nvim-web-devicons

      # File explorer
      oil-nvim
      mini-icons

      # Utilities
      plenary-nvim
      telescope-nvim
      undotree
      vim-wakatime

      # Treesitter with grammars
      treesitterWithGrammars
    ];

    extraPackages = with pkgs; [
      # LSP servers
      lua-language-server
      typescript-language-server
      tailwindcss-language-server
      gopls
      vscode-langservers-extracted # provides eslint language server
      pyright

      # Formatters
      prettierd
      stylua
      rustfmt
      go # provides gofmt

      # Tools for telescope
      ripgrep
      fd

      # Wakatime
      wakatime-cli
    ];
  };

  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua" = {
      source = ./lua;
      recursive = true;
    };
  };
}
