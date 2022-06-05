# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./vim
    ];

  nix = {
    package = pkgs.nixFlakes; 
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfree = true;

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "river"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Australia/Brisbane";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.networkmanager.enable = true;
  networking.extraHosts = "192.168.122.217 ubuntutest";
  # networking.networkmanager.dns = "systemd-resolved";
  # services.resolved.enable = true;
  # services.resolved.extraConfig = "";
  # networking.nameservers = [ "127.0.0.1" ];
  # services.dnsmasq.enable = true;
  # services.dnsmasq.servers = [
  #   "192.168.122.1"
  # ];
  # services.dnsmasq.extraConfig = ''
  #   listen-address=127.0.0.1
  #   interface=lo
  #   server=192.168.1.1
  #   bind-interfaces
  #   local=/home.lab/
  # '';

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.desktopManager.plasma5.useQtScaling = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anthony = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" "libvirtd" ]; # Enable ‘sudo’ for the user.
    group = "users";
    home = "/home/anthony";
    uid = 1000;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    xclip
    calibre
    wget
    firefox
    git
    which
    ranger
    tmux
    ruby
    rubyPackages.rspec
    git-crypt
    gh
    qemu
    sysz
    virt-manager
    vscode
    rbenv
    busybox
    gimp
    neovide
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      configure = {
      customRC = ''
        luafile ~/flakes/nixos/init.lua
          " here your custom configuration goes!

          autocmd FileType nix :packadd vim-nix
	        autocmd TermOpen * setlocal nonumber norelativenumber
          " system clipboard
          " nmap <c-c> "+y
          " vmap <c-c> "+y
          " nmap <c-v> "+p
          " inoremap <c-v> <c-r>+
          " cnoremap <c-v> <c-r>+
          " use <c-r> to insert original character without triggering things like auto-pairs
          " inoremap <c-r> <c-v>

          "AIRLINE
          let g:airline#extensions#tabline#enabled = 1
          let g:airline#extensions#tabline#left_sep = ''
          let g:airline#extensions#tabline#left_alt_sep = ''
          let g:airline#extensions#tabline#fnamemod = ':t'
          let g:airline_theme='onedark'
          let g:airline_powerline_fonts = 1
        '';
        packages.myVimPackage = with pkgs.vimPlugins; {
          # loaded on launch
          start = [ 
	    vim-one 
	    vim-airline
	    vim-airline-themes
	  ];
          # manually loadable by calling `:packadd $plugin-name`
          opt = [ vim-nix ];
        };
      };
    };
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [
          "FiraCode Nerd Font"
	];
      };
    };
  };

  environment.sessionVariables = rec {
    WINIT_X11_SCALE_FACTOR = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

