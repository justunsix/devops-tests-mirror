{ config, pkgs }: {
  packages = with pkgs; [

    neovim
    ## Required Neovim framework dependencies
    gcc
    xsel
    ## Optional Neovim framework dependencies
    ripgrep
    fd
    lazygit
  ];
  programs = { };
}
