use Test::More;

plan tests => 3;

$main::count = 1;

package Foo;
use Mo;
has 'foo' => (is => 'rw');
sub BUILD {
    my $self = shift;
    $self->foo($main::count++);
}

package Boo;
use Mo;
has 'boo' => (is => 'rw');
sub BUILD {
    my $self = shift;
    $self->boo($main::count++);
}

package Bar;
use Mo;
extends 'Foo', 'Boo';
has 'bar' => (is => 'rw');

package Baz;
use Mo;
extends 'Bar';
has 'baz' => (is => 'rw');
sub BUILD {
    my $self = shift;
    $self->baz($main::count++);
}

package Gorch;
use Mo;
extends 'Baz';
has 'gorch' => (is => 'rw');

package main;

my $g = Gorch->new;
is $g->boo, 1, 'boo builds first';
is $g->foo, 2, 'foo builds second';
is $g->baz, 3, 'baz builds third';