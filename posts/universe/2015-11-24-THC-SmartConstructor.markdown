---
title: THC: Smart Constructor
tags: haskell, cheatsheet
---

THC (Tiny Haskell Cheatsheet) showing the concept of a smart constructor.

```
{-# LANGUAGE OverloadedStrings #-}
module Main ( YandexWallet -- NB! We're hiding constructors in exports!
            , yandexWallet -- The only constructor for YandexWallet type!
            , main
            ) where

import           Control.Exception (assert)
import qualified Data.Text         as T

data YandexWallet = YandexWallet T.Text deriving (Show)

yandexWallet :: T.Text -> YandexWallet
yandexWallet x = assert (T.length x == 14) $ YandexWallet x

main = do
  putStrLn $ show $ yandexWallet "6666 6666 6666"
  putStrLn $ show $ yandexWallet "phayul"
```

will produce:


```
Mon Nov 23 23:45:08:450160612 sweater@chill ~ 
λ ghci -XOverloadedStrings  /tmp/Main.hs 
GHCi, version 7.10.2: http://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Main             ( /tmp/Main.hs, interpreted )
Ok, modules loaded: Main.
*Main> main
YandexWallet "6666 6666 6666"
*** Exception: /tmp/Main.hs:13:18-23: Assertion failed
```

Notice, that ``assert`` from Control.Exception is not the only way to
make sure that smart constructors construct correct values, you can do
all sorts of clever things in those. The important part of the concept
is that you hide default constructors and only export the type, then
you write custom constructors for it and export all of those.
