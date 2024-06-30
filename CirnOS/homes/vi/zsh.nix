{ config, pkgs, lib, ... }:


{
  home.packages = with pkgs; [
    eza
    starship
    bat
  ];
  programs.zsh = {
    enable = true;
#    autosuggestion.enable = true;
    enableCompletion = true;
    initExtra = ''
    ${pkgs.hyfetch}/bin/hyfetch
  '';

oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "frisk";
};
    shellAliases = {
      cat = "bat";
      nr = "sudo nixos-rebuild switch --flake /persist/etc/nixos/base/home/#myNixos";
      nclean = "sudo nix-collect-garbage -d";
      base = "cd /persist/etc/nixos/base/home";
      nixconf = "sudo vim /persist/etc/nixos/base/home/nixos/configuration.nix";
      e = "eza -lha";
      eg = "ega -lha | grep";
      ga = " sudo git add";
      gpom = "sudo git push -u origin main";
      gpull = "sudo git pull --rebase origin main";
      gdots = "sudo git remote add origin https://github.com/viaee/NixOS-EYD-Dots.git";
      # gmain = "sudo git branch -m master main";
      gmain = "sudo git branch -M main";
     
       };

     };

programs.starship = {
  enable = true;
  # settings = pkgs.lib.importTOML ./starship.toml;
};

}
