---
title: Articles and papers (January 2015)
tags: links, technical, haskell
arrows: → ⇒ ⇄ ↑ ↩ ⤢ ↱ ↷ ↻ ☛
---

This post provides a list of the coolest articles and papers read by me during January 2015.
Currently, this post is a work in progress.

### [Apfelmus, H. 2009. Monoids and Finger Trees](http://apfelmus.nfshost.com/articles/monoid-fingertree.html)

This is a blog-post about using monoid to turn annotated binary tree into a data-structures-Swiss-army-knife.
Main idea is that because often tag (annotation) of a branch is, practically, a function of annotations of
its children:

```
annotation v a ∷ Tree v a → v
annotation (Branch _ x y) = f (annotation x) (annotation y)
annotation (Leaf   _ a)   = measure a
```

where ``f`` fits axioms of ``mappend`` and ``v`` so often behaves like ``Monoid``, Apfelmus, citing [Hinze, R. and Patterson, R.](http://staff.city.ac.uk/~ross/papers/FingerTree.pdf)
offers following generalization:

```
class Monoid v ⇒ Measured a v where
  measure ∷ a → v

branch ∷ Monoid v ⇒ Tree v a → Tree v a → Tree v a
branch x y = Branch ((annotation x) ◇ (annotation y)) x y

leaf ∷ Measured a v ⇒ a → Tree v a
leaf a = Leaf (measure a) a
```

For practical uses, read the full article, it's quite entertaining.

### [Bruno, L. 2014/15. Nix Pills](http://lethalman.blogspot.com/2014/07/nix-pill-1-why-you-should-give-it-try.html)

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

### [Volkov, N. 2015. Announcing the first class records library](http://nikita-volkov.github.io/record/)

Based on [Volkov, N. 2013. Anonymous records. A solution to the problems of record-system.](https://gist.github.com/nikita-volkov/6977841) proposal, Nikita Volkov suggests using [type-level string literals](https://downloads.haskell.org/~ghc/7.8.3/docs/html/users_guide/type-level-literals.html) to build a library, capable of quite sexy things, like

```
type Person = 
  [r| {name ∷ String, 
       birthday ∷ {year ∷ Int, month ∷ Int, day ∷ Int},
       country ∷ Country} |]

type Country =
  [r| {name ∷ String, 
       language ∷ String} |]

person ∷ Person
person =
  [r| {name = "Yuri Alekseyevich Gagarin", 
       birthday = {year = 1934, month = 3, day = 9},
       country = {name = "Soviet Union", language = "Russian"}} |]
```

A subset of lens are [integrated](https://github.com/nikita-volkov/record/blob/master/library/Record/Lens.hs) with Volkov's records:

```
getPersonBirthdayYear ∷ Person → Int
getPersonBirthdayYear =
  view ([l|birthday|] . [l|year|])

setPersonBirthdayYear ∷ Int → Person → Person
setPersonBirthdayYear =
  set [l|birthday.year|]
```

There's a long way to go for this library, but I really hope for a standard and sane records in Haskell.

### Simons, P. 2014/15. Articles about Haskell with Nix and Haskell NG

#### [Simons, P. 2014. How to set up your Haskell environment](http://permalink.gmane.org/gmane.linux.distributions.nixos/15161)

That's why you read maling lists, not wiki, people. Awesome article by Peter Simons, providing up-to-date information regarding
setting up Haskell environment(s). Helped me to organize my environment. 

#### [Simons, P. 2014. Haskell NG](http://permalink.gmane.org/gmane.linux.distributions.nixos/15113)

Peter explains what haskellngPackages are, which problems they solve and why you should go to nixpkgs and mark
stuff that doesn't build as broken (at least).

Good article to read, to get a perspective of Haskell NG development.

#### [Simons, P. 2015. A Journey into the Haskell NG infrastructure: Part I](http://lists.science.uu.nl/pipermail/nix-dev/2015-January/015591.html)

FAQ about state of the art of Haskell NG and why should we care. Explains ``provideOldHaskellAttributeNames``, explains why did ``ghc-wrapper`` disappear for good.

*Even though at the moment of writing I'm not sure if I
can successfully build yesod and yi on my computer with nix, I have a clear picture of what I should do next.
When I accomplish that, be sure that I'll write a blog post about it.*
