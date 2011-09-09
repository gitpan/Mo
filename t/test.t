use Test::More tests => 13;

package Foo;
use Mo;

has 'this';

package Bar;
use Mo;
extends 'Foo';

has 'that';
has plop => (
    is => 'xy',
    default => sub { my $self = shift; "plop: " . $self->that },
);
has 'plip';

package Baz;
use Mo;

has 'foo';

sub BUILD {
    my $self = shift;
    $self->foo(5);
}

package Maz;
use Mo;
extends 'Baz';

has 'bar';

sub BUILD {
    my $self = shift;
    $self->SUPER::BUILD();
    $self->bar(7);
}

package main;

my $bar = Bar->new(
    this => 'thing',
    that => 'thong',
);

is ref($bar), 'Bar', 'Object created';

ok $bar->isa('Foo'), 'Inheritance works';

is $bar->this, 'thing', 'Read works';
is $bar->that, 'thong', 'Read works in parent class';
is $bar->plop, 'plop: thong', 'default works';
$bar->that("thung");
$bar->plop(undef);
# ok (not(defined $bar->{plop}), 'plop is undef');
is $bar->plop, 'plop: thung', 'default works again';
$bar->that("thyng");
is $bar->plop, 'plop: thung', 'default works again';
is $bar->plip, undef, 'default works';

$bar->this('thang');

is $bar->this, 'thang', 'Write works';

my $baz = Baz->new;
is $baz->foo, 5, 'BUILD works';

$_ = 5;
my $maz = Maz->new;
is $_, 5, '$_ is untouched';
is $maz->foo, 5, 'BUILD works again';
is $maz->bar, 7, 'BUILD works in parent class';
