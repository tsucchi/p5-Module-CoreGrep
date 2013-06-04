#!/usr/bin/perl
use strict;
use warnings;

use Module::CoreGrep qw(is_core_module);
use Test::More;

subtest 'is_core_module', sub {
    my $perl_version = '5.008005';
    ok( is_core_module($perl_version, 'Net::FTP') );
    ok( !is_core_module($perl_version, 'Module::CoreGrep') );
};

subtest 'is_core_module - unknown perl version', sub {
    my $perl_version = '5.008010';
    eval {
        is_core_module($perl_version, 'Net::FTP');
    };
    like $@, qr/^unknown perl version $perl_version/;
};

done_testing;
