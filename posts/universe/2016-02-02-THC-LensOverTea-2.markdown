---
title: THC: Lens Over Tea, Part 1, Segment 2 — Proper Lens
tags: haskell, cheatsheet
---

Here we continue to re-implement Lens Over Tea.

Ongoing work in covering the entire document can be found in my [slides repo](https://github.com/manpages/thc-slides/blob/master/0001-lens-over-tea/Main.hs).

```
{-# LANGUAGE RankNTypes #-}
module Main where

import           Data.Functor         (($>))
import           Data.Functor.Compose (Compose (..))


------------------------------------------------------------------------
type Lens s t a b = forall f . (Functor f) => (a -> f b) -> s -> f t
type Lens' s a = Lens s s a a
ix :: Int -> Lens' [a] a
ix i f []        = lrgErr
ix 0 f (x:rest)  = (:rest) <$> f x
ix i f (x:rest)
  | i < 0 = geqErr
  | True  = (x:) <$> ix (i-1) f rest
------------------------------------------------------------------------
type Getting s a = (a -> Const a a) -> s -> Const a s 
view :: Getting s a -> s -> a
view l = getConst . l Const
------------------------------------------------------------------------
type Setting s t a b = (a -> Identity b) -> s -> Identity t
over :: Setting s t a b -> (a -> b) -> s -> t
over l f = runIdentity . l (Identity . f)
------------------------------------------------------------------------

-- _1 :: Functor f => (a -> f b) -> (a, x) -> f (b, x)
_1 :: Lens (a, x) (b, x) a b
_1 g (k, l) = g k >$< (,l)

-- _2 :: Functor f => (a -> f b) -> (x, a) -> f (x, b)
_2 :: Lens (x, a) (x, b) a b
_2 g (k, l) = g l >$< (k,)

-- Make a lens out of a getter and a setter.
lens :: (s -> a) -> (s -> b -> t) -> Lens s t a b
lens get set g y = (g . get) y >$< set y

-- Combine 2 lenses to make a lens which works on Either. (It's a good idea
-- to try to use bimap for this, but it won't work, and you have to use
-- explicit case-matching. Still a good idea, tho.)
--
-- :: Functor f1, f2, f3 => ((a -> f1 b) -> s1           -> f1 t1            ) ->
--                          ((a -> f2 b) -> s2           -> f2 t2            ) ->
--                           (a -> f3 b) -> Either s1 s2 -> f3 (Either t1 t2)
choosing :: Lens s1 t1 a b -> Lens s2 t2 a b
         -> Lens (Either s1 s2) (Either t1 t2) a b
choosing l1 _  g (Left  y) = l1 g y >$< Left
choosing _  l2 g (Right y) = l2 g y >$< Right

-- Modify the target of a lens and return the result. (Bonus points if you
-- do it without lambdas and defining new functions. There's also a hint
-- before the end of the section, so don't scroll if you don't want it.)
(<%~) :: Lens s t a b -> (a -> b) -> s -> (b, t)
(<%~) l h = l (\x -> (h x, h x))

-- Modify the target of a lens, but return the old value.
(<<%~) :: Lens s t a b -> (a -> b) -> s -> (a, t)
(<<%~) l h = l (\x -> (x, h x))

-- There's a () in every value. (No idea what this one is for, maybe it'll
-- become clear later.)
united :: Lens' s ()
united g = ($>) $ g ()
```
