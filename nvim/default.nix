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
            nvim-lspconfig
            vim-matchup
            neorg
            null-ls-nvim
            nvim-lsp-ts-utils
            (nvim-treesitter.withPlugins (
              plugins: with plugins; [
                tree-sitter-nix
                tree-sitter-lua
                tree-sitter-ruby
                tree-sitter-javascript
                ]
            ))
            telescope-nvim
            toggleterm-nvim
            vim-unimpaired
            gitsigns-nvim
            vim-devicons
            vim-commentary
            vim-surround
          ];
          # manually loadable by calling `:packadd $plugin-name`
          opt = [ vim-nix ];
        };
      };
    };
  };
}
