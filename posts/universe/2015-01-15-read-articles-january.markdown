---
title: Articles and papers (January 2015)
tags: links, technical, haskell
arrows: → ⇒ ⇄ ↑ ↩ ⤢ ↱ ↷ ↻ ☛
---

### [Apfelmus, H. 2009. Monoids and Finger Trees](http://apfelmus.nfshost.com/articles/monoid-fingertree.html)

This is a blog-post about using monoid to turn annotated binary tree into a data-structures-Swiss-army-knife.
Main idea is that because often tag (annotation) of a branch is, practically, a function of annotations of
its children:

```
annotation v a :: Tree v a → v
annotation (Branch _ x y) = f (annotation x) (annotation y)
annotation (Leaf   _ a)   = measure a
```

where ``f`` fits axioms of ``mappend`` and ``v`` so often behaves like ``Monoid``, Apfelmus, citing [Hinze, R. and Patterson, R.](http://staff.city.ac.uk/~ross/papers/FingerTree.pdf)
offers following generalization:

```
class Monoid v ⇒ Measured a v where
  measure :: a → v

branch :: Monoid v ⇒ Tree v a → Tree v a → Tree v a
branch x y = Branch ((annotation x) `mappend` (annotation y)) x y

leaf :: Measured a v ⇒ a → Tree v a
leaf a = Leaf (measure a) a
```

For practical uses, read the full article, it's quite entertaining.
