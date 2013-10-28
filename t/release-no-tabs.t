
BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::NoTabsTests 0.05

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'bin/mo-inline',
    'lib/Mo.pm',
    'lib/Mo.pod',
    'lib/Mo/Design.pod',
    'lib/Mo/Features.pod',
    'lib/Mo/Golf.pm',
    'lib/Mo/Hacking.pod',
    'lib/Mo/Inline.pm',
    'lib/Mo/Moose.pm',
    'lib/Mo/Moose.pod',
    'lib/Mo/Mouse.pm',
    'lib/Mo/Mouse.pod',
    'lib/Mo/build.pm',
    'lib/Mo/build.pod',
    'lib/Mo/builder.pm',
    'lib/Mo/builder.pod',
    'lib/Mo/chain.pm',
    'lib/Mo/chain.pod',
    'lib/Mo/coerce.pm',
    'lib/Mo/coerce.pod',
    'lib/Mo/default.pm',
    'lib/Mo/default.pod',
    'lib/Mo/exporter.pm',
    'lib/Mo/exports.pod',
    'lib/Mo/import.pm',
    'lib/Mo/import.pod',
    'lib/Mo/importer.pm',
    'lib/Mo/importer.pod',
    'lib/Mo/is.pm',
    'lib/Mo/is.pod',
    'lib/Mo/nonlazy.pm',
    'lib/Mo/option.pm',
    'lib/Mo/option.pod',
    'lib/Mo/required.pm',
    'lib/Mo/required.pod',
    'lib/Mo/xs.pm',
    'lib/Mo/xs.pod'
);

notabs_ok($_) foreach @files;
done_testing;
