---
title: THC: Lens Over Tea, Part 1, Segment 1 — ix
tags: haskell, cheatsheet
---

While proof-reading [lens over tea](http://artyom.me/) series, I've decided to challenge myself
with the following — without reading code presented in the article series,
implement important functions mentioned in the article.

I think that series like that are perfect for teaching huge libraries such as length.

```
{-# LANGUAGE RankNTypes #-}
module Main where

import           Data.Functor         (($>))
import           Data.Functor.Compose (Compose (..))

geqErr = error "index must be geq 0"
lrgErr = error "index too large"
iGuard x y z f =
  if x < 0
     then geqErr
     else f x y z

type Lens s a = (a -> a) -> s -> (a, s)
type LensL s a = (a -> [a]) -> s -> (a, [s])
type LensF s a = forall f . (Functor f) => (a -> f a) -> s -> (a, f s)

ix :: Int -> Lens [a] a
ix i f xs =
  iGuard i f xs ixDo
  where
    ixDo _ _ []       = lrgErr
    ixDo 0 f (x:rest) = (x, ((f x):rest))
    ixDo i f (x:rest) = let (x', rest') = ixDo (i-1) f rest in
                            (x', x:rest')

ixl :: Int -> LensL [a] a
ixl i f xs =
  iGuard i f xs ixDo
  where
    ixDo _ _ []       = lrgErr
    ixDo 0 f (x:rest) = (x, [(x':rest) | x' <- f x])
    ixDo i f (x:rest) = let (x', rest') = ixDo (i-1) f rest in
                            (x', map (x:) rest')

ixf :: Int -> LensF [a] a
ixf i f xs =
  iGuard i f xs ixDo
  where
    ixDo _ _ []       = lrgErr
    ixDo 0 f (x:rest) = (x, (:rest) <$> f x)
    ixDo i f (x:rest) = let (x', rest') = ixDo (i-1) f rest in
                            (x', (x:) <$> rest')

---

type LensF1 s a = forall f . (Functor f) => (a -> f a) -> s -> f s

-- |
-- λ> let (Pair x y) = ixf1 6 (\x -> Pair (Const x) [666]) [1..10]
-- λ> (getConst x,y)
-- (7,[[1,2,3,4,5,6,666,8,9,10]])
ixf1 :: Int -> LensF1 [a] a
ixf1 i f xs =
  iGuard i f xs ixDo
  where
    ixDo _ _ []       = lrgErr
    ixDo 0 f (x:rest) = (:rest) <$> f x
    ixDo i f (x:rest) = (x:) <$> ixDo (i-1) f rest
```
