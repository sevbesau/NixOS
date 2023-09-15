# NixOS Config

This repo houses my own configurations for NixOS, built using a NixOS flake.

'Nix is a tool that takes a unique approach to package management and system configuration. Learn how to make reproducible, declarative and reliable systems.' _nixos.org_

## Some handy links

- [NixOS package/options search](https://search.nixos.org/packages)
- [Home-manager options](https://nix-community.github.io/home-manager/options.html)
- [Flake setup inspiration](https://github.com/Misterio77/nix-config/)

## What to do when /boot fills up

First remove the older generations with:

```sh
sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +2
```

Then issue a new build, this will clean up boot and add the new build
Use the script from this repo (recommended)

```sh
$ ./buildAndSwitch
```

Or generally

```sh
sudo nixos-rebuild switch
```
