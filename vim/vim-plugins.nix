{ nixpkgs }:

with nixpkgs;

let inherit (vimUtils) buildVimPluginFrom2Nix; in {

  "vim-styled-components" = buildVimPluginFrom2Nix {
    name = "vim-styled-components";
    src = fetchgit {
      url = "https://github.com/styled-components/vim-styled-components";
      rev = "75e178916fc3e61385350933a23055927f5f60b7";
      sha256 = "0rq34sbw58na3y68rrf1b2wbrxpzfg7sk2952plxjmwgbc2zgxkj";
    };
  };

  # "vim-graphql" = buildVimPluginFrom2Nix {
  #   name = "vim-graphql";
  #   src = fetchgit {
  #     url = "https://github.com/jparise/vim-graphql";
  #     rev = "9a9fe186a73fce636398ee7f851466ef60c9fde5";
  #     sha256 = "06m3n60gdfczg7wp4lvxmlb212qcc1yfvq4pjc6z6k6q81jrl4wi";
  #   };
  # };

  # "kmonad-vim" = buildVimPluginFrom2Nix {
  #   name = "kmonad-vim";
  #   src = fetchgit {
  #     url = "https://github.com/kmonad/kmonad-vim";
  #     rev = "37978445197ab00edeb5b731e9ca90c2b141723f";
  #     sha256 = "13p3i0b8azkmhafyv8hc4hav1pmgqg52xzvk2a3gp3ppqqx9bwpc";
  #   };
  # };


  # "horizon" = buildVimPluginFrom2Nix {
  #   name = "horizon";
  #   src = fetchgit {
  #     url = "https://github.com/ntk148v/vim-horizon";
  #     rev = "ca8ca90d14190aeadc352cf9f89c3508c304ec02";
  #     sha256 = "1qwrybl6f0mc57r7bj9x393536inv2pcccy5lc3g663z4k1dixfr";
  #   };
  # };

  # "photon" = buildVimPluginFrom2Nix {
  #   name = "photon";
  #   src = fetchgit {
  #     url = "https://github.com/axvr/photon.vim.git";
  #     rev = "046b79c2c210c126575f34a1d96ee66d293e594b";
  #     sha256 = "1hz3m0yz06cgwyrs9v9hxm8cx7lsr4pgn0livpxz62d69cp09c0z";
  #   };
  # };
}

