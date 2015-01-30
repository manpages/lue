---
title: One-liners (January 2015)
tags: howto
---

### Make a LQ-gif with FFMPEG

``` 
ffmpeg -i ~/in -vf scale=320:-1 -t 10 -r 12 -ss 186 \
       -loop 0 out.gif
```

It might be not obvious that here -loop 0 means that GIF
will has no delay between loops. As one might guess, -r
defines rate, -t defines the length of period to dump and
-ss denotes the offset.

Result:

![](http://i.imgur.com/R7d5lvL.gif)

### Clean ghc package cache

```
mv ~/.ghc/x86_64-linux-7.8.4{,.old}
```

### System upgrade in NixOS

Equivalent of changing mirrorlist options in Arch Linux — 

```
nix-channel --add \
  https://nixos.org/channels/nixpkgs-unstable
```

Equivalent of ``pacman -Sy`` (synchronize package database) —

```
nix-channel --update
```

Equivalent of ``pacman -Su`` (install fresh stuff) —

```
nixos-rebuild switch --upgrade
```
