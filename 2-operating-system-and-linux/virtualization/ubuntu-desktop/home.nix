{ config, pkgs, ... }:

let
  pkgs = import <nixpkgs> { };
  lib = pkgs.lib;

  installEditor = builtins.getEnv "INSTALL_EDITOR" == "true";
  installDevOps = builtins.getEnv "INSTALL_DEVOPS" == "true";
  installAnsible = builtins.getEnv "INSTALL_ANSIBLE" == "true";

  # Shells and convenience tools
  baseConfig = import ./nix-modules/base.nix { inherit config pkgs; };

  # Conditional packages and programs
  editorConfig = if installEditor then
    import ./nix-modules/editor.nix { inherit config pkgs; }
  else {
    packages = [ ];
    programs = { };
  };
  devopsConfig = if installDevOps then
    import ./nix-modules/devops.nix { inherit config pkgs; }
  else {
    packages = [ ];
    programs = { };
  };
  ansibleConfig = if installAnsible then
    import ./nix-modules/ansible.nix { inherit config pkgs; }
  else {
    packages = [ ];
    programs = { };
  };

in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vagrant";
  home.homeDirectory = "/home/vagrant";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Globally enable shell integration for all supported shells
  home.shell.enableShellIntegration = true;

  # The home.packages option allows you to install Nix packages into 
  # your environment.
  home.packages = baseConfig.packages ++ editorConfig.packages
    ++ devopsConfig.packages ++ ansibleConfig.packages;

  # Merge programs configurations
  programs = lib.mkMerge [
    baseConfig.programs
    editorConfig.programs
    devopsConfig.programs
    ansibleConfig.programs
  ];

  # Merge all programs configurations
  #home.programs = basePackages.programs // editorConfig.programs
  #  // devopsConfig.programs // ansibleConfig.programs;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vagrant/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    # Point kubeconfig to k3s
    KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
  };

  ##########################
  # Programs Configuration #
  ##########################
  # See https://nix-community.github.io/home-manager/options.xhtml

}
