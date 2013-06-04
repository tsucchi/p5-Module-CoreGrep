package Module::CoreGrep;
use base qw(Exporter);
use 5.008005;
use strict;
use warnings;

use Module::CoreList;

our $VERSION = "0.01";
our @EXPORT_OK = qw(is_core_module);


sub new {
    my ($class, %option) = @_;
    my $self = {
        perl_version => $option{perl_version},
    };
    bless $self, $class;
}

sub coregrep {
    my ($self, @module_names) = @_;
    my @result = grep { is_core_module($self->{perl_version}, $_) } @module_names;
    return @result;
}

sub coregrep_v {
    my ($self, @module_names) = @_;
    my @result = grep { !is_core_module($self->{perl_version}, $_) } @module_names;
    return @result;
}

sub is_core_module {
    my ($perl_version, $module_name) = @_;
    if( !exists $Module::CoreList::version{$perl_version} ) {
        die "unknown perl version " . $perl_version . "\n";
    }
    return exists $Module::CoreList::version{$perl_version}{$module_name};
}

1;
__END__

=encoding utf-8

=head1 NAME

App::coregrep - It's new $module

=head1 SYNOPSIS

    use App::coregrep;

=head1 DESCRIPTION

App::coregrep is ...

=head1 LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takuya Tsuchida E<lt>takuya.tsuchida@gmail.comE<gt>

=cut

