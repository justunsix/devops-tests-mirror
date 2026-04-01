{ config, pkgs }: {
  packages = with pkgs; [

    podman
    lazydocker
    ## k8s
    k9s
    kubectx
    stern
  ];

}

