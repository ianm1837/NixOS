# Ian's NixOS Config

## Description
This repository houses my current running NixOS config. This does _not_ include home configurations at this time, only system with users and applications. 

### Installation Steps:
- install OS from .iso
- add line to /etc/nixos/configuration.nix
```
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```
- Change hostname in same file with desired machine name
- Run command
```
sudo nixos-rebuild switch
```
- create folder in home directory to store nix flake
	- Suggested name ".dotfiles" for future home-manager integration
- clone repository
```
git clone https://github.com/ianm1837/NixOS.git
```
- Change "hostname" in flake.nix to match name of current system
- run command to enable config
```
sudo nixos-rebuild switch --flake .
```