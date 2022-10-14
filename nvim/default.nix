{ config, pkgs,  ... }:

let 
  nvim-tree = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-tree.lua";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-tree";
      repo=  "nvim-tree.lua";
      rev = "b07701f9da3ec62016ad46002a6c0ae9b414574c";
      sha256 = "xC4zFCMSo+qmh0VVmRGOMvjEYi3kop1ncBDwk8uxEQ0=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-tree.lua/";
  };

in {
  environment.systemPackages = with pkgs; [
    neovide

    purescript
    spago

    rubyPackages.solargraph
    sumneko-lua-language-server
    stylua

    nodejs-16_x
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.eslint
    nodePackages.prettier
    nodePackages.live-server
    nodePackages.create-react-app
  ];
  environment.sessionVariables = rec {
    NVIM_DIR = builtins.toString ~/Repos/NixOS-config/nvim ;
  };
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
            nvim-tree
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
                tree-sitter-haskell
                tree-sitter-lua
                tree-sitter-ruby
                tree-sitter-javascript
                tree-sitter-json
                tree-sitter-json5
                tree-sitter-jsdoc
                tree-sitter-norg
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
