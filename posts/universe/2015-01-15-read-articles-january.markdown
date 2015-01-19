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
branch x y = Branch ((annotation x) ◇ (annotation y)) x y

leaf :: Measured a v ⇒ a → Tree v a
leaf a = Leaf (measure a) a
```

For practical uses, read the full article, it's quite entertaining.

### [Bruno, L. 2014–2015. Nix Pills](http://lethalman.blogspot.com/2014/07/nix-pill-1-why-you-should-give-it-try.html)

Luca is doing important job of covering grounds of interactive documentation for Nix
package manager and NixOS.

Nix pills start with trivial stuff, like language overview and basic expressions and are taking reader
to an entertaining ride through some specific parts of Nix workflows that might be obscure for a Nix
newcomer.

The design of the blog is pretty terrible 
(see initial ``callPackage`` definition in 
[this post](http://lethalman.blogspot.com/2014/09/nix-pill-13-callpackage-design-pattern.html)), 
but with w3m or lynx, it's pretty readable.

### [Drake, A. 2014. Command-line tools can be 235× faster than your Hadoop cluster](http://aadrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html)

A great post that boils down to the simple notion of choosing the right tool for the job, hinting the need
of hiring experienced software architects and doing R&D properly (not following the hype).
