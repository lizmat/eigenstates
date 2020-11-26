use Test;
use eigenstates;

plan 4;

is-deeply eigenstates(1|2|3), (1,2,3), 'did we get the eigenstates';
is-deeply eigenstates(42),      (42,), 'did we get the object';
is-deeply eigenstates(Int),    (Int,), 'did we get the type object';

class C { has $.j is rw }

my $c = C.new;
$c.j = 1|2;
is-deeply eigenstates($c.j), (1,2), 'did we get the decontainerized attribute';
