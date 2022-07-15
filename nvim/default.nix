{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovide

    rubyPackages.solargraph
    sumneko-lua-language-server
    stylua

    nodejs-16_x
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.eslint
    nodePackages.prettier
  ];
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      configure = {
      customRC = builtins.readFile ./.vimrc; 
        packages.myVimPackage = with pkgs.vimPlugins; {
          # loaded on launch
          start = [
            onedark-nvim
            nvim-tree-lua
            nvim-web-devicons
            lualine-nvim
            bufferline-nvim
            indent-blankline-nvim
            vim-matchup
            neorg

            # LSP
            nvim-lspconfig
            nvim-lsp-ts-utils
            null-ls-nvim
            lspkind-nvim

            # DEBUGGER
            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text

            # COMPLETEION
            nvim-cmp
            cmp-buffer
            cmp-path
            cmp-cmdline
            cmp-nvim-lsp

            # SNIPPETS
            luasnip

            # TREESITTER
            (nvim-treesitter.withPlugins (
              plugins: with plugins; [
                tree-sitter-nix
                tree-sitter-lua
                tree-sitter-ruby
                tree-sitter-javascript
                tree-sitter-json
                tree-sitter-json5
                tree-sitter-jsdoc
                ]
            ))

            # TELESCOPE
            telescope-nvim

            # TERMINAL
            toggleterm-nvim

            # GIT
            gitsigns-nvim

            vim-unimpaired
            vim-devicons
            vim-commentary
            vim-surround
          ];
          # manually loadable by calling `:packadd $plugin-name`
          opt = [];
        };
      };
    };
  };
}
