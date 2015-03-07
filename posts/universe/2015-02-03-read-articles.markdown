---
title: Articles and papers (February 2015)
tags: links, technical, haskell
arrows: → ⇒ ⇄ ↑ ↩ ⤢ ↱ ↷ ↻ ☛
---



### [tedu. 2015. Heartbleed in Rust](http://www.tedunangst.com/flak/post/heartbleed-in-rust) <a href="#silverBulltes" name="silverBulltes">¶</a>

Even though I do think that this post is pretty pointless, I found it entertaining.
Besides, I do agree with tedu when he says

>  The point here isn’t to pick on rust. I could have written the same program
>  with the same flaw in go, or even haskell if I were smart enough to
>  understand burritos. The point is that if we don’t actually understand what
>  vulnerabilities like Heartbleed are, we are unlikely to eliminate them
>  simply by switching to a magic vulnerability proof language. Everyone may
>  have heard about Heartbleed, but that doesn’t necessarily make it a good
>  exemplar.
>
> Perhaps Heartbleed is a just a stand in term referring not to Heartbleed
> itself, but rather any number of other bugaboos. I’m not sure that’s better.
> Vulnerabilities like Heartbleed but not too much like Heartbleed is a poorly
> defined class. It’s hard to assess any claims about such a class.
>
> When speaking about vulnerabilities and how they can be resolved, we should
> try to be precise and accurate. The hype around Heartbleed (and ShellShock,
> etc.) makes them attractive targets to latch an argument on to, but in doing
> so we must be careful that our chosen example fits the argument.
> Misidentified problems lead to misapplied solutions.

Silver-bullet cultists, static-typing fundamentalists and functional
programming purists shouldn't be taken seriously because fundamentalism in any
shape and form blinds its adept and makes her detached from reality.

That being said, I find the post pointless because, after stripping fundamentalist
bullshit, we're left with a statement like “while writing idiomatic parsers in
functional style we severely reduce the probability of having leaky buffers”. 
Ugly optimizations, however, oftentimes break the idiomaticness of the code, hence
the whole discussion retards to a simple pair of non-contradicting statements not
worth the holy war.



### Leeming C. 2014/15. On Docker <a href="#antiDocker" name="antiDocker">¶</a>
#### [Let's review.. Docker (again)](http://iops.io/blog/docker-hype/)
#### [LXC containers are awesome, but Docker.io sucks](http://iops.io/blog/lxc-application-containers-docker-initial-thoughts/)

Docker is the most famous LXC/AUFS wrapper. I didn't care enough to dig it
even though we were using it in production with one of the companies I was
working for.

In the linked posts is pretty reasonable critique of this library. Looks like my gut feeling about
projects in Go is yet to fail me.



### [Dolstra E., Visser E. 2008. The Nix Build Farm: A Declarative Approach to Continuous Integration.](http://nixos.org/~eelco/pubs/buildfarm-wasdett2008-final.pdf) <a href="#hydra" name="hydra">¶</a>
A [later, more complete version](http://nixos.org/~eelco/pubs/hydra-scp-submitted.pdf) of this
paper is available as well.  
This paper describes Hydra, the current CI system used to test Nix expressions.
A perfect thing to read before you make your first Hydra deployment.



### [Gonzalez G. 2015. Use Haskell for shell scripting](http://www.haskellforall.com/2015/01/use-haskell-for-shell-scripting.html) <a href="#shHaskell" name="shHaskell">¶</a>

Interesting project, use case of which is limited to one thing — simple shell-scripting
for teams of Haskell programmers/dev-ops. I really hope that someone will either write a
translator from Turtle to Shell, or nobody will going to ever use this library for writing
user-facing scripts.



### [Cowley A. 2015. Robots on Haskell](https://www.youtube.com/watch?v=2-JFkv9-JOQ) <a href="#robotsOnHaskell" name="robotsOnHaskell">¶</a>

Mirror: 

<video src="../../images/robotsOnHaskell.mp4"
       style="text-align: center; width: 100%"
       controls="controls" />

### [Barbour D. 2014. VCache, an Acid-State Killer](https://awelonblue.wordpress.com/2014/12/19/vcache-an-acid-state-killer/) <a href="#acidHaskell" name="acidHaskell">¶</a>

Ambitious library that is designed to perform well with large amounts of data, address larger-than-RAM 
scenario and compose better than acid-state.

I will definitely give it a try and put demos on Github.

It should be noted though that I think of acid-state as a library best suited for prototyping in Haskell.
It provides reasonable (run-time) correctness guarantees that we persist the types we want to persist
and bootstraps development of a Haskell application. VCache, on the other hand, aims to be a production-
grade persistent library for non-cyclic data.

### [Piponi D. 2014. Cofree meets Free](http://blog.sigfpe.com/2014/05/cofree-meets-free.html) <a href="#cofree" name="cofree">¶</a>

This article and the talk referenced touches co-things in algebraic systems.
It gives pretty concise metaphor for machines with state and buttons being analogous to
comonads, for instance. In some way, this is a codescription of cothings to the one 
given by someone on [Haskellcast](http://www.haskellcast.com/)<sup>c.n.</sup>.

### [Conal E. 2014. On FRP and Denotational Design](http://www.haskellcast.com/episode/009-conal-elliott-on-frp-and-denotational-design) <a href="#conalElliott" name="conalElliott">¶</a>

Insightful episode of Haskellcast.

### Miscellaneous and revisited links <a href="#misc" name="misc">¶</a>

- [Inkscape 0.91 release notes](http://wiki.inkscape.org/wiki/index.php/Release_notes/0.91)
    + [10 most exciting features in Inkscape 0.91](http://vimeo.com/118352978)
- [NixOS UEFI installation USB](http://nixaid.com/usb-bootable-nixos-uefi/)
- [NixOS installation USB](http://nixaid.com/usb-bootable-nixos/)
- [Pull request “nixos: iso-image: use syslinux bootloader for USB booting support”](https://github.com/NixOS/nixpkgs/pull/4678)
- Interesting nixpkgs forks
    + [ryantrinkle's ghcjs branch](https://github.com/ryantrinkle/nixpkgs/tree/ghcjs-ng)
    + [arseny](https://github.com/jagajaga/nixpkgs)
    + [nixos (duh)](https://github.com/nixos/nixpkgs)
