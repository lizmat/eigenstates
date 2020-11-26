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

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/eigenstates . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2020 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

