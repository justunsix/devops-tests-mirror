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

    # Development
    ## Rust
    cargo
    rustc
    clippy
    #### Rust watch source like tests
    # cargo-watch
    #### Rust LSP
    rust-analyzer
    #### Rust formatter
    rustfmt
  ];
  programs = { };
}
