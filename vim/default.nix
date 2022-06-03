{ pkgs, ...}:

with pkgs;

let myVim = vim_configurable.customize {
  name = "vim";
  vimrcConfig = {
    customRC = builtins.readFile ./.vimrc;
    vam.knownPlugins = pkgs.vimPlugins; #// import ./vim-plugins.nix;
    vam.pluginDictionaries = [
      { names = [
          # colorschemes
          "vim-one"
          # "horizon"
          # "photon"
          # "kmonad-vim"

          # completeion, linting, formatting
          # "ale"
          # "coc-nvim"
          # "coc-tsserver"
          # "coc-tslint"
          # "coc-prettier"
          # "coc-json"
          # "coc-eslint"
          "emmet-vim"
          "indentLine"
          "vim-commentary"
          "vim-surround"
          "vim-signify"

          # file menus
          "nerdtree"
          "nerdtree-git-plugin"
          "vim-nerdtree-syntax-highlight"
          "vim-devicons"

          # statusline
          "vim-airline"
          "vim-airline-themes"

          # language specific
          "vim-javascript"
          # "vim-styled-components"
          # "vim-graphql"
          "typescript-vim"
          "vim-nix"

          # mobility
          "vim-tmux"
          "vim-unimpaired"

          # general
          "vim-startify"
        ];}
      ];
    };
  };
in {
  environment.systemPackages = with pkgs; [ myVim ];
  environment.variables = { EDITOR = "vim"; };
}
