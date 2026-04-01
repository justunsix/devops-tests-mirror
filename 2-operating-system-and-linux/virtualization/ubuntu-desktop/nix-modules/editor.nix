{ config, pkgs }:
{
  packages = with pkgs; [

    neovim
    ## Required Neovim framework dependencies
    gcc
    xsel
    ## Optional Neovim framework dependencies
    ripgrep
    fd
    lazygit
    tree-sitter
    ### Needed by Mason
    unzip

    # Development
    ## Prettier formatter multi-language
    prettier
    ## Node
    nodejs

  ];
  programs = { };
}
