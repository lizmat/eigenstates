my class eigenstates:ver<0.0.4>:auth<cpan:ELIZABETH> { }  # just for mi6

proto sub eigenstates(|) is export {*}
multi sub eigenstates(Junction:D $junction --> List:D) {
    use nqp;
    nqp::getattr($junction,Junction,'$!eigenstates').List
}
multi sub eigenstates(Mu \object --> List:D) {
    (object,)
}

=begin pod

=head1 NAME

eigenstates - expose the eigenstates of an object

=head1 SYNOPSIS

=begin code :lang<raku>

  use eigenstates;

  say eigenstates(1|2|3);  # 1 2 3

  say eigenstates(42);     # 42

=end code

=head1 DESCRIPTION

The eigenstates distribution exports a single subroutine called C<eigenstates>
that returns a list of the eigenstates of an object.  For all objects except
C<Junction>s, that's a list with the given object.  For a C<Junction>, it
returns the internal values (aka "eigenstates") as a List.

=head1 TECHNICAL BACKGROUND

Developers starting to use Raku often wonder why there is C<Mu> class that
is the parent of the C<Any> class, with the C<Any> class being the default
class.  The reason for this is the existence of C<Junction>s.  If you look
at the parent classes of e.g. C<Int>:

=begin code :lang<raku>

  say Int.^mro;       # ((Int) (Cool) (Any) (Mu))

=end code

However, if you look at the parent classes of C<Junction>:

=begin code :lang<raku>

  say Junction.^mro;  # ((Junction) (Mu))

=end code

you will notice that C<Junction> is B<NOT> a subclass of C<Any>.  It is
B<that> fact that makes autothreading of values inheriting from C<Any> work.

As a consequence, if you want to create a subroutine / method with a signature
that will take a C<Junction> "as is", you will need to give it a C<Mu>
constraint.  Compare the behaviour of:

=begin code :lang<raku>

  sub auto-threading($value) {   # implicit Any
      say $value;
  }
  auto-threading( 42 | 666 );   # 42␤666␤

=end code

with:

=begin code :lang<raku>

  sub non-threading(Mu $value) {
      say $value;
  }
  non-threading( 42 | 666 );   # any(42, 666)

=end code

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/eigenstates . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2020 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
