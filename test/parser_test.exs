defmodule ParserTest do
  use ExUnit.Case
  doctest H4cc.Parser

  setup do
    file = 
    File.open!("test/testfile.md", [:read])
    |> IO.read(:all)
    |> String.split("\n", trim: true)
    {:ok, tfile: file}
  end

  test "Parser.parse_file test", %{tfile: file} do
    assert H4cc.Parser.parse_file(file) == %{"Actors" => [%H4cc.Lib{commited: nil,
      desc: "Pipelined flow processing engine.", folder: "Actors",
      is_git: true, name: "dflow", stars: 0, url: "https://github.com/dalmatinerdb/dflow"},
      %H4cc.Lib{commited: nil, desc: "Helpers for easier implementation of actors in Elixir.",
      folder: "Actors", is_git: true, name: "exactor", stars: 0,
      url: "https://github.com/sasa1977/exactor"},
      %H4cc.Lib{commited: nil, desc: "A Port Wrapper which forwards cast and call to a linked Port.",
      folder: "Actors", is_git: true, name: "exos", stars: 0,
      url: "https://github.com/awetzel/exos"},
      %H4cc.Lib{commited: nil, desc: "Railway Flow-Based Programming with Elixir GenStage.",
      folder: "Actors", is_git: true, name: "flowex", stars: 0,
      url: "https://github.com/antonmi/flowex"},
      %H4cc.Lib{commited: nil, desc: "A minimal GenServer that monitors a given GenEvent handler.",
      folder: "Actors", is_git: true, name: "mon_handler", stars: 0,
      url: "https://github.com/tattdcodemonkey/mon_handler"},
      %H4cc.Lib{commited: nil, desc: "Create a pool based on a hash ring.", folder: "Actors",
      is_git: true, name: "pool_ring", stars: 0, url: "https://github.com/camshaft/pool_ring"},
      %H4cc.Lib{commited: nil, desc: "A hunky Erlang worker pool factory.", folder: "Actors",
      is_git: true, name: "poolboy", stars: 0, url: "https://github.com/devinus/poolboy"}],
      "Algorithms and Data structures" => [%H4cc.Lib{commited: nil,
      desc: "An Elixir wrapper library for Erlang's array.",
      folder: "Algorithms and Data structures", is_git: true, name: "array", stars: 0,
      url: "https://github.com/takscape/elixir-array"},
      %H4cc.Lib{commited: nil,
      desc: "Aruspex is a configurable constraint solver, written purely in Elixir.",
      folder: "Algorithms and Data structures", is_git: true, name: "aruspex", stars: 0,
      url: "https://github.com/dkendal/aruspex"},
      %H4cc.Lib{commited: nil,
      desc: "Pure Elixir implementation of [bitmaps](https://en.wikipedia.org/wiki/Bitmap).",
      folder: "Algorithms and Data structures", is_git: true,
      name: "bitmap", stars: 0, url: "https://github.com/hashd/bitmap-elixir"},
      %H4cc.Lib{commited: nil,
      desc: "This application implements a so-called circuit-breaker for Erlang.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "fuse", stars: 0, url: "https://github.com/jlouis/fuse"},
      %H4cc.Lib{commited: nil,
      desc: "A generic finite state-machine - Elixir wrapper around OTP's gen_fsm.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "gen_fsm", stars: 0, url: "https://github.com/pavlos/gen_fsm"},
      %H4cc.Lib{commited: nil, desc: "An Elixir library for performing 2D and 3D mathematics.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "graphmath", stars: 0, url: "https://github.com/crertel/graphmath"},
      %H4cc.Lib{commited: nil, desc: "A consistent hash-ring implementation for Elixir.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "hash_ring_ex", stars: 0, url: "https://github.com/reset/hash-ring-ex"},
      %H4cc.Lib{commited: nil, desc: "Fast Elixir implementation of HyperLogLog.",
      folder: "Algorithms and Data structures", is_git: true, name: "hypex", stars: 0,
      url: "https://github.com/zackehh/hypex"},
      %H4cc.Lib{commited: nil,
      desc: "Indifferent access for Elixir maps/list/tuples with custom key conversion.",
      folder: "Algorithms and Data structures", is_git: true, name: "indifferent", stars: 0,
      url: "https://github.com/vic/indifferent"},
      %H4cc.Lib{commited: nil,
      desc: "Isaac is an elixir module for ISAAC: a fast cryptographic random number generator.",
      folder: "Algorithms and Data structures", is_git: true, name: "isaac", stars: 0,
      url: "https://github.com/arianvp/elixir-isaac"},
      %H4cc.Lib{commited: nil, desc: "Erlang 2-way Set Associative Map.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "key2value", stars: 0, url: "https://github.com/okeuday/key2value"},
      %H4cc.Lib{commited: nil,
      desc: "Elixir implementation of a binary Galois Linear Feedback Shift Register.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "lfsr", stars: 0, url: "https://github.com/pma/lfsr"},
      %H4cc.Lib{commited: nil, desc: "A CRDT library with Î´-CRDT support.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "loom", stars: 0, url: "https://github.com/asonge/loom"},
      %H4cc.Lib{commited: nil, desc: "Luhn algorithm in Elixir.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "luhn", stars: 0, url: "https://github.com/ma2gedev/luhn_ex"},
      %H4cc.Lib{commited: nil, desc: "LZ4 bindings for Erlang for fast data compressing.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "lz4", stars: 0, url: "https://github.com/szktty/erlang-lz4"},
      %H4cc.Lib{commited: nil,
      desc: "A memoization macro (defmemo) for elixir using a genserver backing store.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "memoize", stars: 0, url: "https://github.com/os6sense/DefMemo"},
      %H4cc.Lib{commited: nil, desc: "A Merkle hash tree implementation in Elixir.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "merkle_tree", stars: 0, url: "https://github.com/yosriady/merkle_tree"},
      %H4cc.Lib{commited: nil, desc: "Elixir library extending `Enum.min_by/2`, `Enum.max_by/2` and `Enum.min_max_by/2` to return a list of results instead of just one.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "minmaxlist", stars: 0, url: "https://github.com/seantanly/elixir-minmaxlist"},
      %H4cc.Lib{commited: nil,
      desc: "A library for performing math on number 'arrays' in binaries.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "mmath", stars: 0, url: "https://github.com/dalmatinerdb/mmath"},
      %H4cc.Lib{commited: nil, desc: "Haskell inspired monads in Elixir stylish syntax.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "monad", stars: 0, url: "https://github.com/rmies/monad"},
      %H4cc.Lib{commited: nil, desc: "Upgrade your Elixir pipelines with monads.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "monadex", stars: 0, url: "https://github.com/rob-brown/MonadEx"},
      %H4cc.Lib{commited: nil,
      desc: "A pure Elixir implementation of the non-cryptographic hash Murmur3.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "murmur", stars: 0, url: "https://github.com/gmcabrita/murmur"},
      %H4cc.Lib{commited: nil, desc: "Elixir natural sort implementation for lists of strings.",
      folder: "Algorithms and Data structures", is_git: true,
      name: "natural_sort", stars: 0, url: "https://github.com/DanCouper/natural_sort"}],
      "Books" => [%H4cc.Lib{commited: nil, desc: "Bring Elixir into your company, with real-life strategies from the people who built Elixir and use it successfully at scale. This book has all the information you need to take your application from concept to production (2017).",
      folder: "Books", is_git: false, name: "Adopting Elixir", stars: 0,
      url: "https://pragprog.com/book/tvmelixir/adopting-elixir"},
      %H4cc.Lib{commited: nil,
      desc: "This book is a set of recipes grouped by topic by Paulo A Pereira (2015).",
      folder: "Books", is_git: false, name: "Elixir Cookbook", stars: 0,
      url: "https://www.packtpub.com/application-development/elixir-cookbook"},
      %H4cc.Lib{commited: nil, desc: "Open doors to powerful new techniques that will get you thinking about web development in fundamentally new ways (2017).",
      folder: "Books", is_git: false, name: "Functional Web Development with Elixir, OTP, and Phoenix",
      stars: 0,
      url: "https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix"},
      %H4cc.Lib{commited: nil,
      desc: "PDF, MOBI, and EPUB documents for Elixir's Getting Started tutorial (2016).",
      folder: "Books", is_git: true, name: "Getting Started - Elixir", stars: 0,
      url: "https://github.com/potatogopher/elixir-getting-started"},
      %H4cc.Lib{commited: nil, desc: "A gentle introduction to the language, with lots of code examples and exercises by Simon St. Laurent and J. David Eisenberg (2013).",
      folder: "Books", is_git: false, name: "Introducing Elixir ", stars: 0,
      url: "http://shop.oreilly.com/product/0636920030584.do"},
      %H4cc.Lib{commited: nil, desc: "This book shows how Rails developers can benefit from their existing knowledge to learn Phoenix. By Elvio Vicosa (2017).",
      folder: "Books", is_git: false, name: "Phoenix for Rails Developers", stars: 0,
      url: "http://www.phoenixforrailsdevelopers.com"},
      %H4cc.Lib{commited: nil, desc: "builds on your existing web dev skills, teaching you the unique benefits of Phoenix along with just enough Elixir to get the job done. By Geoffrey Lessel (2017).",
      folder: "Books", is_git: false, name: "Phoenix in Action",
      stars: 0, url: "https://manning.com/books/phoenix-in-action"},
      %H4cc.Lib{commited: nil, desc: "The goal of this series is to enable you as a Confident Phoenix developer. There are 3 different editions to address varied needs of devs jumping into Phoenix.",
      folder: "Books", is_git: false, name: "Phoenix Inside Out",
      stars: 0, url: "https://shankardevy.com/phoenix-book/"}],
      "Websites" => [%H4cc.Lib{commited: nil, desc: "Your go-to Elixir Toolbox.", 
      folder: "Websites", is_git: false, name: "Awesome Elixir @LibHunt", stars: 0,
      url: "https://elixir.libhunt.com"},
      %H4cc.Lib{commited: nil, desc: "A blog consisting of mostly Elixir posts.",
      folder: "Websites", is_git: false, name: "Benjamin Tan - Learnings & Writings", 
      stars: 0, url: "http://benjamintan.io/blog/tags/elixir/"},
      %H4cc.Lib{commited: nil, desc: "A collection of small Elixir programming language examples.",
      folder: "Websites", is_git: false, name: "Elixir Examples",
      stars: 0, url: "http://elixir-examples.github.io/"},
      %H4cc.Lib{commited: nil, desc: "Flashcards are a powerful way to improve your knowledge. Elixircards are hand crafted, professionally printed flashcards for levelling up your Elixir.",
      folder: "Websites", is_git: false, name: "Elixir Flashcards",
      stars: 0, url: "https://elixircards.co.uk/"},
      %H4cc.Lib{commited: nil, desc: "The project's wiki, containing much useful information.",
      folder: "Websites", is_git: true, name: "Elixir Github Wiki",
      stars: 0, url: "https://github.com/elixir-lang/elixir/wiki"},
      %H4cc.Lib{commited: nil, desc: "Weekly programming problems to help you learn Elixir.",
      folder: "Websites", is_git: false, name: "Elixir Quiz",
      stars: 0, url: "http://elixirquiz.github.io/"},
      %H4cc.Lib{commited: nil, desc: "Collection of patterns & solutions to common problems in Elixir.",
      folder: "Websites", is_git: false, name: "Elixir Recipes",
      stars: 0, url: "http://elixir-recipes.github.io/"},
      %H4cc.Lib{commited: nil, desc: "An Elixir regular expression editor & tester.",
      folder: "Websites", is_git: false, name: "Elixre", stars: 0,
      url: "http://www.elixre.uk/"},
      %H4cc.Lib{commited: nil, desc: "Small posts about Elixir from the team at Hashrocket.",
      folder: "Websites", is_git: false, name: "Hashrocket Today I Learned - Elixir", stars: 0,
      url: "https://til.hashrocket.com/elixir"},
      %H4cc.Lib{commited: nil, desc: "Explanation and intro to Elixir by JosÃ© Valim.",
      folder: "Websites", is_git: false, name: "How I start - Elixir",
      stars: 0, url: "http://howistart.org/posts/elixir/1"},
      %H4cc.Lib{commited: nil, desc: "A blog about a Professional Software Engineer learning Elixir.",
      folder: "Websites", is_git: false, name: "Learning Elixir",
      stars: 0, url: "http://learningelixir.joekain.com/"}]} 
  end

  test "Parser.prepare_lib test" do
    assert H4cc.Parser.prepare_lib({"## Folder", ["* [Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)](https://pragprog.com/book/cmelixir/metaprogramming-elixir) - Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", "* [Phoenix for Rails Developers](http://www.phoenixforrailsdevelopers.com) - This book shows how Rails developers can benefit from their existing knowledge to learn Phoenix."]}) == {"Folder", [%H4cc.Lib{commited: nil, desc: "Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", folder: "Folder", is_git: false, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: 0, url: "https://pragprog.com/book/cmelixir/metaprogramming-elixir"}, %H4cc.Lib{commited: nil, desc: "This book shows how Rails developers can benefit from their existing knowledge to learn Phoenix.", folder: "Folder", is_git: false, name: "Phoenix for Rails Developers", stars: 0, url: "http://www.phoenixforrailsdevelopers.com"}]}
  end

  test "Parser.parse_str test" do
    assert H4cc.Parser.parse_str("[Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)](https://github.com/book/cmelixir/metaprogramming-elixir) - Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", "Folder") == %H4cc.Lib{commited: nil, desc: "Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", folder: "Folder", is_git: true, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: 0, url: "https://github.com/book/cmelixir/metaprogramming-elixir"}
  end

  test "Parser.get_name test" do
    assert H4cc.Parser.get_name({"[Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)](https://github.com/book/cmelixir/metaprogramming-elixir) - Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", %H4cc.Lib{folder: "Folder"}}) == {"(https://github.com/book/cmelixir/metaprogramming-elixir) - Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", %H4cc.Lib{commited: nil, desc: nil, folder: "Folder", is_git: false, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: 0, url: nil}}
  end

  test "Parser.get_url test" do
    assert H4cc.Parser.get_url({"(https://github.com/book/cmelixir/metaprogramming-elixir) - Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", %H4cc.Lib{commited: nil, desc: nil, folder: "Folder", is_git: nil, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: 0, url: nil}}) == {" - Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", %H4cc.Lib{commited: nil, desc: nil, folder: "Folder", is_git: nil, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: 0, url: "https://github.com/book/cmelixir/metaprogramming-elixir"}}
  end

  test "Parser.get_desc test" do
    assert H4cc.Parser.get_desc({" - Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", %H4cc.Lib{commited: nil, desc: nil, folder: "Folder", is_git: nil, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: nil, url: "https://github.com/book/cmelixir/metaprogramming-elixir"}}) == %H4cc.Lib{commited: nil, desc: "Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", folder: "Folder", is_git: nil, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: nil, url: "https://github.com/book/cmelixir/metaprogramming-elixir"}
  end

  test "Parser.check_url test 1" do
    assert H4cc.Parser.check_url(%H4cc.Lib{commited: nil, desc: "Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", folder: "Folder", is_git: false, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: 0, url: "https://github.com/book/cmelixir/metaprogramming-elixir"}) == %H4cc.Lib{commited: nil, desc: "Thorough explanation on how to exploit Elixir's metaprogramming capabilities to improve your Elixir (2015).", folder: "Folder", is_git: true, name: "Metaprogramming Elixir: Write Less Code, Get More Done (and Have Fun!)", stars: 0, url: "https://github.com/book/cmelixir/metaprogramming-elixir"}
  end

  test "Parser.check_url test 2" do
    assert H4cc.Parser.check_url(%H4cc.Lib{commited: nil, desc: "Description", folder: "Folder", is_git: false, name: "Name", stars: 0, url: "https://someurl.com"}) == %H4cc.Lib{commited: nil, desc: "Description", folder: "Folder", is_git: false, name: "Name", stars: 0, url: "https://someurl.com"}
  end
end
