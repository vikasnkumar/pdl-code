use strict;
use warnings;
use ExtUtils::MakeMaker;

our ($GSL_includes, $GSL_libs); 
my @pack = (['gsl_sf_debye.pd', qw(DEBYE PDL::GSLSF::DEBYE)]);
my %hash = pdlpp_stdargs_int(@pack);
$hash{INC} .= ' '.$GSL_includes;
push @{$hash{LIBS}},$GSL_libs;

undef &MY::postamble; # suppress warning
*MY::postamble = sub { pdlpp_postamble_int(@pack); };
WriteMakefile(%hash);
