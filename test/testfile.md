# Awesome Elixir [![Build Status](https://api.travis-ci.org/h4cc/awesome-elixir.svg?branch=master)](https://travis-ci.org/h4cc/awesome-elixir) [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
A curated list of amazingly awesome Elixir libraries, resources, and shiny things inspired by [awesome-php](https://github.com/ziadoz/awesome-php).

If you think a package should be added, please add a :+1: (`:+1:`) at the according issue or create a new one.

There are [other sites with curated lists of elixir packages](#other-awesome-lists) which you can have a look at.

- [Awesome Elixir](#awesome-elixir)
    - [Actors](#actors)
    - [Algorithms and Data structures](#algorithms-and-data-structures)
- [Resources](#resources)
    - [Books](#books)
    - [Websites](#websites)
- [Contributing](#contributing)

## Actors
*Libraries and tools for working with actors and such.*

* [dflow](https://github.com/dalmatinerdb/dflow) - Pipelined flow processing engine.
* [exactor](https://github.com/sasa1977/exactor) - Helpers for easier implementation of actors in Elixir.
* [exos](https://github.com/awetzel/exos) - A Port Wrapper which forwards cast and call to a linked Port.
* [flowex](https://github.com/antonmi/flowex) - Railway Flow-Based Programming with Elixir GenStage.
* [mon_handler](https://github.com/tattdcodemonkey/mon_handler) - A minimal GenServer that monitors a given GenEvent handler.
* [pool_ring](https://github.com/camshaft/pool_ring) - Create a pool based on a hash ring.
* [poolboy](https://github.com/devinus/poolboy) - A hunky Erlang worker pool factory.

## Algorithms and Data structures
*Libraries and implementations of algorithms and data structures.*

* [array](https://github.com/takscape/elixir-array) - An Elixir wrapper library for Erlang's array.
* [aruspex](https://github.com/dkendal/aruspex) - Aruspex is a configurable constraint solver, written purely in Elixir.
* [bitmap](https://github.com/hashd/bitmap-elixir) - Pure Elixir implementation of [bitmaps](https://en.wikipedia.org/wiki/Bitmap).
* [fuse](https://github.com/jlouis/fuse) - This application implements a so-called circuit-breaker for Erlang.
* [gen_fsm](https://github.com/pavlos/gen_fsm) - A generic finite state-machine - Elixir wrapper around OTP's gen_fsm.
* [graphmath](https://github.com/crertel/graphmath) - An Elixir library for performing 2D and 3D mathematics.
* [hash_ring_ex](https://github.com/reset/hash-ring-ex) - A consistent hash-ring implementation for Elixir.
* [hypex](https://github.com/zackehh/hypex) - Fast Elixir implementation of HyperLogLog.
* [indifferent](https://github.com/vic/indifferent) - Indifferent access for Elixir maps/list/tuples with custom key conversion.
* [isaac](https://github.com/arianvp/elixir-isaac) - Isaac is an elixir module for ISAAC: a fast cryptographic random number generator.
* [key2value](https://github.com/okeuday/key2value) - Erlang 2-way Set Associative Map.
* [lfsr](https://github.com/pma/lfsr) - Elixir implementation of a binary Galois Linear Feedback Shift Register.
* [loom](https://github.com/asonge/loom) - A CRDT library with δ-CRDT support.
* [luhn](https://github.com/ma2gedev/luhn_ex) - Luhn algorithm in Elixir.
* [lz4](https://github.com/szktty/erlang-lz4) - LZ4 bindings for Erlang for fast data compressing.
* [memoize](https://github.com/os6sense/DefMemo) - A memoization macro (defmemo) for elixir using a genserver backing store.
* [merkle_tree](https://github.com/yosriady/merkle_tree) - A Merkle hash tree implementation in Elixir.
* [minmaxlist](https://github.com/seantanly/elixir-minmaxlist) - Elixir library extending `Enum.min_by/2`, `Enum.max_by/2` and `Enum.min_max_by/2` to return a list of results instead of just one.
* [mmath](https://github.com/dalmatinerdb/mmath) - A library for performing math on number 'arrays' in binaries.
* [monad](https://github.com/rmies/monad) - Haskell inspired monads in Elixir stylish syntax.
* [monadex](https://github.com/rob-brown/MonadEx) - Upgrade your Elixir pipelines with monads.
* [murmur](https://github.com/gmcabrita/murmur) - A pure Elixir implementation of the non-cryptographic hash Murmur3.
* [natural_sort](https://github.com/DanCouper/natural_sort) - Elixir natural sort implementation for lists of strings.

# Resources
Various resources, such as books, websites and articles, for improving your Elixir development skills and knowledge.

## Books
*Fantastic books and e-books.*

* [Adopting Elixir](https://pragprog.com/book/tvmelixir/adopting-elixir) - Bring Elixir into your company, with real-life strategies from the people who built Elixir and use it successfully at scale. This book has all the information you need to take your application from concept to production (2017).
* [Elixir Cookbook](https://www.packtpub.com/application-development/elixir-cookbook) - This book is a set of recipes grouped by topic by Paulo A Pereira (2015).
* [Functional Web Development with Elixir, OTP, and Phoenix](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix) - Open doors to powerful new techniques that will get you thinking about web development in fundamentally new ways (2017).
* [Getting Started - Elixir](https://github.com/potatogopher/elixir-getting-started) - PDF, MOBI, and EPUB documents for Elixir's Getting Started tutorial (2016).
* [Introducing Elixir ](http://shop.oreilly.com/product/0636920030584.do) - A gentle introduction to the language, with lots of code examples and exercises by Simon St. Laurent and J. David Eisenberg (2013).
* [Phoenix for Rails Developers](http://www.phoenixforrailsdevelopers.com) - This book shows how Rails developers can benefit from their existing knowledge to learn Phoenix. By Elvio Vicosa (2017).
* [Phoenix in Action](https://manning.com/books/phoenix-in-action) - builds on your existing web dev skills, teaching you the unique benefits of Phoenix along with just enough Elixir to get the job done. By Geoffrey Lessel (2017).
* [Phoenix Inside Out](https://shankardevy.com/phoenix-book/) - The goal of this series is to enable you as a Confident Phoenix developer. There are 3 different editions to address varied needs of devs jumping into Phoenix.

## Websites
*Useful Elixir-related websites.*

* [Awesome Elixir @LibHunt](https://elixir.libhunt.com) - Your go-to Elixir Toolbox.
* [Benjamin Tan - Learnings & Writings](http://benjamintan.io/blog/tags/elixir/) - A blog consisting of mostly Elixir posts.
* [Elixir Examples](http://elixir-examples.github.io/) - A collection of small Elixir programming language examples.
* [Elixir Flashcards](https://elixircards.co.uk/) - Flashcards are a powerful way to improve your knowledge. Elixircards are hand crafted, professionally printed flashcards for levelling up your Elixir.
* [Elixir Github Wiki](https://github.com/elixir-lang/elixir/wiki) - The project's wiki, containing much useful information.
* [Elixir Quiz](http://elixirquiz.github.io/) - Weekly programming problems to help you learn Elixir.
* [Elixir Recipes](http://elixir-recipes.github.io/) - Collection of patterns & solutions to common problems in Elixir.
* [Elixre](http://www.elixre.uk/) - An Elixir regular expression editor & tester.
* [Hashrocket Today I Learned - Elixir](https://til.hashrocket.com/elixir) - Small posts about Elixir from the team at Hashrocket.
* [How I start - Elixir](http://howistart.org/posts/elixir/1) - Explanation and intro to Elixir by José Valim.
* [Learning Elixir](http://learningelixir.joekain.com/) - A blog about a Professional Software Engineer learning Elixir.

# Contributing
Please see [CONTRIBUTING](https://github.com/h4cc/awesome-elixir/blob/master/.github/CONTRIBUTING.md) for details.
