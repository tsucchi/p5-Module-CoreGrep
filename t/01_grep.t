#!/usr/bin/perl
use strict;
use warnings;

use Module::CoreGrep;
use Test::More;

subtest 'coregrep', sub {
    my $app = Module::CoreGrep->new( perl_version => '5.008005' );
    is_deeply( [$app->coregrep('Net::FTP', 'File::Basename', 'Module::CoreGrep')],   ['Net::FTP', 'File::Basename'] );
};

subtest 'coregrep_v', sub {
    my $app = Module::CoreGrep->new( perl_version => '5.008005' );
    is_deeply( [$app->coregrep_v('Net::FTP', 'File::Basename', 'Module::CoreGrep')], ['Module::CoreGrep'] );
};


subtest 'coregrep - unknown version of perl', sub {
    my $app = Module::CoreGrep->new( perl_version => '5.008010' ); # perl 5.8.10 does not exist.
    eval {
        $app->coregrep('Net::FTP');
    };
    like $@, qr/^unknown perl version 5\.008010/;
};

subtest 'coregrep_v - unknown version of perl', sub {
    my $app = Module::CoreGrep->new( perl_version => '5.008010' ); # perl 5.8.10 does not exist.
    eval {
        $app->coregrep_v('Net::FTP');
    };
    like $@, qr/^unknown perl version 5\.008010/;
};

done_testing;
