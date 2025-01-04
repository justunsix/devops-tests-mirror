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
    ### Mason
    unzip

    # Development
    ## Prettier formatter multi-language
    nodePackages.prettier
    ## Node
    ### LTS as of 2025-01
    nodejs_22

  ];
  programs = { };
}
