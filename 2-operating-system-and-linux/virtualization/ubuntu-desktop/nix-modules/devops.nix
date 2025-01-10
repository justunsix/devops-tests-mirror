{ config, pkgs }: {
  packages = with pkgs; [

    lazydocker
    ## k8s
    k9s
    kubectx
    stern
  ];

}

