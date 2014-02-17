package NUCSurf::NumericProfiler;


use 5.006;
use strict;
use warnings FATAL => 'all';
use Carp;
#use Smart::Comment;

=head1 NAME

NUCSurf::RuleCataloge - The great new NUCSurf::NumericProfiler!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

require Exporter;

our @ISA         = qw(Exporter);
our %EXPORT_TAGS = ();
our @EXPORT_OK   = ();
our @EXPORT      = qw();

=head1 SYNOPSIS

the sub module list to generate the numeric profile of the seq depending upon the windpw size.
Simple Usage.

    use NUCSurf::NumericProfiler;
    my $foo = NUCSurf::NumericProfiler->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS
=cut
sub new {
    my ($class) = shift;
    my $self    = {};
    bless $self,$class;
    return $self;
}


=head2 numeric_profiler_2ktuple
Title     : numeric_profiler_2ktuple
Usage     : $obj->numeric_profiler_2ktuple()
Function  : get description or other value for the specified property
Returns   : none
Argument  : 
=cut
sub numeric_profiler_2ktuple {

    my ($self,$hash_ref,$seqence) = @_;

    my %tempCal    = ();
    my $windowSize = $hash_ref->{_window_size};
    my %dataCal    = ();

    while ( length($seqence) != 0 &&
            length($seqence) != 1
    ) {

        my $tuple = substr($seqence,0,2,"");
        $tuple    =~tr/A-Z/a-z/;

        foreach my $propertyName ( @{ $hash_ref->{_2ktuple_rule} } ) {

            if ( ! (exists $dataCal{$propertyName}) ) {
                $dataCal{$propertyName} = "";
            }

            if ($windowSize == 1) {
                $dataCal{$propertyName} = $hash_ref->{$propertyName}{_data}{$tuple} . " "
                        if (exists $hash_ref->{$propertyName}{_data}{$tuple});
                $dataCal{$propertyName} = "0" . " "
                        if (! exists $hash_ref->{$propertyName}{_data}{$tuple} ) ;
                        #this bracket made me waste 1/2 an hour
            }
            else {

                if ( exists $hash_ref->{$propertyName}{_data}{$tuple} ) {
                    push @{ $tempCal{$propertyName} },
                        $hash_ref->{$propertyName}{_data}{$tuple};
                }
                else {
                    push @{ $tempCal{$propertyName} },0;
                }

                if ( scalar(@{$tempCal{$propertyName}}) != $windowSize ) {
                    my $strExpr = join ("+",@{ $tempCal{$propertyName} });
                    my $sum  = eval($strExpr);
                    eval {
                            $sum = $sum/$windowSize;
                            $sum = sprintf("%.3f",$sum);
                    };
                    my $err = $@;
                    if ($err eq "") {
                        $dataCal{$propertyName} .= "$sum"." ";
                    }
                    else {
                        $dataCal{$propertyName} .= "0"." ";
                    }
                    pop @{$tempCal{$propertyName}};
                }
            }
        }
    }
    return \%dataCal;
}

=head2 numeric_profiler_3ktuple
Title     : numeric_profiler_3ktuple
Usage     : $obj->numeric_profiler_3ktuple()
Function  : get description or other value for the specified property
Returns   : none
Argument  : 
=cut
sub numeric_profiler_3ktuple {

    my ($self,$hash_ref,$seqence) = @_;

    my %tempCal    = ();
    my $windowSize = $hash_ref->{_window_size};
    my %dataCal    = ();

    while ( length($seqence) != 0 &&
            length($seqence) != 1 &&
            length($seqence) != 2
    ) {

        my $tuple = substr($seqence,0,3,"");
        $tuple    =~tr/A-Z/a-z/;

        foreach my $propertyName ( @{ $hash_ref->{_3ktuple_rule} } ) {

            if ( ! (exists $dataCal{$propertyName}) ) {
                $dataCal{$propertyName} = "";
            }

            if ($windowSize == 1) {
                $dataCal{$propertyName} = $hash_ref->{$propertyName}{_data}{$tuple} . ","
                        if (exists $hash_ref->{$propertyName}{_data}{$tuple});
                $dataCal{$propertyName} = "0" . ","
                        if (! exists $hash_ref->{$propertyName}{_data}{$tuple} ) ;
                        #this bracket made me waste 1/2 an hour
            }
            else {

                if ( exists $hash_ref->{$propertyName}{_data}{$tuple} ) {
                    push @{ $tempCal{$propertyName} },
                        $hash_ref->{$propertyName}{_data}{$tuple};
                }
                else {
                    push @{ $tempCal{$propertyName} },0;
                }

                if ( scalar(@{$tempCal{$propertyName}}) != $windowSize ) {
                    my $strExpr = join ("+",@{ $tempCal{$propertyName} });
                    my $sum  = eval($strExpr);
                    eval {
                            $sum = $sum/$windowSize;
                            $sum = sprintf("%.3f",$sum);
                    };
                    my $err = $@;
                    if ($err eq "") {
                        $dataCal{$propertyName} .= "$sum"." ";
                    }
                    else {
                        $dataCal{$propertyName} .= "0"." ";
                    }

                    pop @{ $tempCal{$propertyName} };
                }
            }
        }
    }
    return \%dataCal;
}

=head1 AUTHOR

abuzar hamza, C<< <abuzarhamza at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-nucsurf at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NucSURF>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc NucSURF::RuleCataloge


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=NucSURF>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/NucSURF>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/NucSURF>

=item * Search CPAN

L<http://search.cpan.org/dist/NucSURF/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 abuzar hamza.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of NucSURF::RuleCataloge

