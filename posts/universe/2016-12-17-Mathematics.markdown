---
title: On Abstraction and Learning in Mathematics
---

Goal of this lecture is to describe the concept of Abstraction in an
understandable manner. It should cover the process of learning and
display how abstraction works in logic and geometry, as well as
providing information about the pattern recognition and noticing
similarities that trigger abstraction.

What is abstraction in the big picture? It is a process of
creating a framework to think about a class of problems or
processes. In this framework are normally included two things —

Simplest empirical abstraction that has practical value: numbers
abstract over quantity of similar things.

Humans noticed that when different similar objects can be grouped and
counted. Sheep or horses, amount of soldiers in an army, all different,
but similar as we can calculate the precise quantity of those. This
gives raise to natural numbers, such as 1, 2, 3, ... . Interestingly,
when armies fight and the amount of soldiers decrease due to injury
or, G-d forbid, death, the quantity changes, which gives raise to the
operation of subtraction. When new cattle is born, the amount of sheep
in the herd increases, which gives raise to addition.

 1. Objects that represent generalized version of entities that we
    work with while dealing with a class of problems or the process we
    abstract over. In the example with natural numbers, entities are
    things that are similar to each other — sheep, soldiers, et
    cetera. We abstract over the type of entity and the order in which
    we count those, assigning numbers to groups based on result of
    counting entities in those. Object in this example is a number.
 2. Relations that represent how objects compare to each other. In our
    example, relation would be “belonging to a group of similar things”,
    which is an abstraction over “soldiers belonging to west army,
    soldiers belonging to north army, sheep in Joe's herd”.
 3. Operations on objects which allow us to get a desired
    result, which is either a solution for a problem or a useful
    description of a process. Operations in the example we're working
    with abstract over events, such as birth of cattle or injury of
    soldiers.

Notice, that the example is abstraction that is purely based on
experience. For example, it doesn't give raise to negative numbers
(such as -5, -42), or to real numbers, such as (9¾, 13.37).

HW #1: Which experience, that we should experience daily, can
give raise to the abstract notion of real numbers?

This is a perfect example of empirical abstraction, the one that was
made through experience.

Mathematics for at least a couple of last centuries, however, strives
to bring the abstraction approach to the absolute, becoming
self-contained, disregarding relation to the physical and social
world. For instance, when we're talking about natural numbers as
mathematicians, we prefer to disregard things we can do with numbers,
such as counting sheep or calculating losses in our army, but instead
provide a system of objects and operations in the vacuum of itself. We
will discuss how can it be so useful later on.

Now let's ponder on the concept of this different sort of abstraction
a little bit more (the explanation we provide here is almost
completely taken from a paper by Michael Mitchelmore et al, that
surveys the proceedings in understanding and defining abstraction in
mathematics and mathematical learning[2]).

 1. Mathematics uses everyday words, but their meaning is defined
    precisely in relation to other mathematical terms and not by their
    everyday meaning. Even the syntax of mathematical argument (such
    as proofs) is different from the syntax of everyday language and
    is again quite precisely defined. These ideas are demonstrated
    pretty well in the first chapter of “Proofs and Fundamentals” by
    E. D. Bloch[1].
 2. Mathematics contains objects which are unique to itself. For example,
    although everyday language occasionally uses symbols like x and p,
    objects like x^p or sqrt(-1) are unknown outside mathematics.
 3. A large part of mathematics consists of rules for operating on 
    mathematical objects and relationships. It is important that
    students learn to manipulate symbols using these rules and no
    others. For example, if we have a category that contains as
    objects things that aren't necessarily numeric, and a custom
    operation “+” is defined on it, we can't use operation “×” just
    because we feel like addition and multiplication are closely
    related. We can think of operations on mathematical objects as of
    rules of a board game, such as the way pieces move in chess.

These three aspects of mathematics make it unfeasible, or — even
stronger — impossible to construct objects, relations and operations
using empirical abstraction. Instead, an axiomatic approach is used,
which we will illustrate, continuing the example of natural numbers.

Here is an accurate enough description of the most famous way in which
natural numbers are defined in mathematics. It is called “Peano Axioms”.

 1. $ 0 $ is a number.
 2. If $ a $ is a number, $ S(a) $ is a number.
 3. There is no such number $ a $ that $ 0 = S(a) $.
 4. $ m = n $ iff $ S(m) = S(n) $
 5. If a set $ I $ contains $ 0 $ and also successor of every number
    in $ I $ then $ I $ contains all numbers.

From those axioms, we can formally derive true statements. Those are
called “lemmas” or “theorems” and the derivation is called “a proof”.

For instance, based on this list of axioms, we can prove that if $ m $
and $ n $ are equal then successor of successor of $ n $ is equal to
successor of successor of $ m $.

HW#2 (optional): Prove it.

If we will run around, making an axiomatic out of every interesting
abstraction, we'll quickly get tangled with a bunch of different
incompatible chunks of mathematics. However, we would like to have a
way to develop axioms and prove statements with those (or, in other
words, develop theories) completely independently. This is why in
mathematics there is a notion of foundations. A foundation is a
special bunch of axioms that provide mathematician with everything
necessary to unify their new shiny theory with the work of other
mathematicians on their shiny theories. The result of a process of
specifying how exactly does a theory map onto a foundation is called
“a model”. For example, a model of the Peano axioms is a 3-tuple
$ (N, 0, S) $, where $ N $ is an infinite set, $ 0 \\in N $, and
$ S: N \\to N $ satisfies Peano Axioms. This maps well to foundations
such as ZF set theory.

Even though mathematics is developed as a thing in itself, it is
useful.

Mathematics allows us to carry out computations. Starting from
calculating change in a shop, ending in solving equations for some
variable given parameters. For example, using calculations we can
decide how many stops can we afford to make in order to travel from
one country in Europe to another under a certain amount of time.

Mathematics is a powerful, if not the only proper tool for building
models.  Models are never 100%-precise, but useful to predict outcomes
of processes in reality. For instance, we can have a model of a bet
winning given historical data which is inherently probabilistic, or we
can have a model of a rocket vertically landing on a launchpad, so that
we don't have to construct expensive rockets to check their properties.

Another important application of mathematics is reasoning. Example of
mathematically-powered reasoning can be found in computer programming,
where it allows us to extract interesting information about our
programs. The kinds of this information are vast: starting from
complexity analysis, ranging over simple type systems and type systems
with dependent types (where you can write type-level programs), to
complex and featureful proof assistants to generate proofs about the
properties of software. Mathematical logic also might help in mundane
reasoning.

Theories such as category theory show correspondence between different
fields of knowledge, pointing how they map to each other, making
results from one field applicable to another field.

Finally, let's formulate informally the answer to the question "how to
learn mathematics?".

In order to learn mathematics, we have to see patterns and
similarities in a problem domain. Often it is hard to see those, so we
can use guided approach, where those similarities are suggested by an
educator. As we are sure that those similarities aren't noise, but are
indeed characteristic to a given problem domain, we empirically
abstract over those. Here we as students should try our best to come
up with abstractions ourselves, keeping in mind the problems we want
to solve. If we are studying with an educator, an educator should
criticize our abstractions and point out some things that we might
have missed. At the end of this back-and-forth, we should end up with
a class of good-enough abstractions for the problem domain that help
us solve practical problems. Next step is to play with those empirical
abstractions and build up an intuition about how they work. With the
intuition in place, we can now learn corresponding mathematical
abstractions. This process will be reinforced with developed
intuition, hence it should be relatively simple to fit mathematical
abstractions in our head (simple does not necessarily mean easy!). In
order to verify success in learning of mathematical abstractions, we
should periodically solve exercises and mathematical problems. Now
that we have mastered a mathematical theory or its part, vast
opportunities lie as we proceed. We can decide to use it in practice,
we can see how this theory correlates with other theories, check if
there are generalizations of it. Most importantly though, have fun
while learning and using your knowledge!

References:

[1] E.D.Bloch: Proofs and Fundamentals — http://www.unalmed.edu.co/~cemejia/doc/bloch.pdf
[2] Michael Mitchelmore et al: Abstraction In Mathematics and Mathematics Learning — http://www.emis.de/proceedings/PME28/RR/RR031_Mitchelmore.pdf
