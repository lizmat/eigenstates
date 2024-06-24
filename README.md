[![Actions Status](https://github.com/lizmat/eigenstates/workflows/test/badge.svg)](https://github.com/lizmat/eigenstates/actions)

NAME
====

eigenstates - expose the eigenstates of an object

SYNOPSIS
========

```raku
use eigenstates;

say eigenstates(1|2|3);  # 1 2 3

say eigenstates(42);     # 42
```

DESCRIPTION
===========

The eigenstates distribution exports a single subroutine called `eigenstates` that returns a list of the eigenstates of an object. For all objects except `Junction`s, that's a list with the given object. For a `Junction`, it returns the internal values (aka "eigenstates") as a List.

TECHNICAL BACKGROUND
====================

Developers starting to use Raku often wonder why there is `Mu` class that is the parent of the `Any` class, with the `Any` class being the default class. The reason for this is the existence of `Junction`s. If you look at the parent classes of e.g. `Int`:

```raku
say Int.^mro;       # ((Int) (Cool) (Any) (Mu))
```

However, if you look at the parent classes of `Junction`:

```raku
say Junction.^mro;  # ((Junction) (Mu))
```

you will notice that `Junction` is **NOT** a subclass of `Any`. It is **that** fact that makes autothreading of values inheriting from `Any` work.

As a consequence, if you want to create a subroutine / method with a signature that will take a `Junction` "as is", you will need to give it a `Mu` constraint. Compare the behaviour of:

```raku
sub auto-threading($value) {   # implicit Any
    say $value;
}
auto-threading( 42 | 666 );   # 42␤666␤
```

with:

```raku
sub non-threading(Mu $value) {
    say $value;
}
non-threading( 42 | 666 );   # any(42, 666)
```

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/eigenstates . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2020, 2021, 2022, 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

