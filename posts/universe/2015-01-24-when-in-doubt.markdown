---
title: When in doubt, clean ghc package cache
tags: haskell, nixos
---

When in doubt,

```
mv ~/.ghc/x86_64-linux-7.8.4{,.old}
```

especially if you do a lot of library testing outside nix shell.

Nix can't collect garbage from your local ghc-pkg cache.
