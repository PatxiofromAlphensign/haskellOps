![haskell.png](./haskell.svg)

Notes
-----
General (improvised) notes on haskell & undocumented venture of haskell features

look out on `no Instacne arising errors` 

#### possible deducable bounds
| issue | fix |
|-------|-----|
| parameter passing  to <function> has no Instance arising | instance singnature must comply when passing. it can be composition as well as many other things that create <fold> | 
| <function> has no Instance arising | none | 
| `cabal v2-build` can not find `*.h` | the `cpp` flag wasn't able to search the `*.h` files, only works with cabal builds (passing the parameter of ) | 

goals
======
* declutter/organize code to fit a multi-module paradigm
* make cabal builds in virutal envs
* make template type predicates (like what `basefunctor` in [TH.hs](./recursion-schemes/src/Data/Functor/Foldable/TH.hs))

refs
====

[recurisonSchemes](https://github.com/recursion-schemes/recursion-schemes.git)

[write yourself a Scheme in 48 hours](https://en.wikibooks.org/wiki/Write_Yourself_a_Scheme_in_48_Hours)

TODO
====
[todo](./todo.md) list
