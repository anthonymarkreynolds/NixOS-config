{ config, pkgs,  ... }:

with pkgs.vimUtils;

let
  nvim-tree = buildVimPluginFrom2Nix {
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
  twilight-nvim = buildVimPluginFrom2Nix {
    pname = "twilight.lua";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo=  "twilight.nvim";
      rev = "1ffa6a4d89fb2fbb784c6674044bf54f1fca936f";
      sha256 = "ryjYff6ljCTx9wwq3idl5g34Kjr4zbOJLON3oYqvgas=";
    };
    meta.homepage = "https://github.com/folke/twilight.nvim";
  };
  neononame = buildVimPluginFrom2Nix {
    pname = "neononame.lua";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "nyngwang";
      repo= "neononame.lua";
      rev ="575f48c708dd19f2c873c3abb42b15a49060ab47";
      sha256 ="j6lyRA4Xq75GJLBXfxA5JSdSsA3AVhHrmCsWHPf4EZs=";
    };
    meta.homepage = "https://github.com/nyngwang/NeoNoName.lua";
  };
  neog = buildVimPluginFrom2Nix {
    pname = "neorg.lua";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-neorg";
      repo= "neorg";
      rev = "278e989435b5859ae8b3bcb8d718cd57ba106412";
      sha256 = "1HzxGC1J7GVfff+R9SbQ+rPr26l0sZkiha5jsZp/e6E=";
    };
    meta.homepage = "https://github.com/nvim-neorg/neorg";
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
            twilight-nvim
            neononame
            emmet-vim

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
                tree-sitter-embedded-template
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
