{ config, pkgs }: {
  packages = with pkgs; [

    # ansible
    # python-pywinrm is needed for some tasks on Windows
    # python312Packages.pywinrm
  ];
  programs = { };
}

