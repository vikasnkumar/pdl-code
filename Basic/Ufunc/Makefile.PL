use strict;
use warnings;
use ExtUtils::MakeMaker;

my @pack = (["ufunc.pd", qw(Ufunc PDL::Ufunc)]);

if ($^O eq 'dec_osf') {
       require Config;
       if ($Config::Config{cc} =~ /^cc/) {
               my $no_optimize = ($::PDL_OPTIONS{OPTIMIZE} && $::PDL_OPTIONS{OPTIMIZE})
                                || $Config::Config{optimize}
                                || '-g2';
               $no_optimize =~ s/(\s|^)(-O)\d/$1${2}0/;
               $no_optimize =~ s/(\s|^)(-g)\d/$1${2}2/;
               print <<EOT;
       Digital Unix cc optimizer has a bug that is
       triggered by primitive.c. Therefore
EOT
               # Becaue OPTIMIZE in PASTHRU it can't be overridden so
               # it gets hard coded in Makefile
               eval q|
                       sub MY::const_cccmd {
                               package MY;
                               my $defval = shift->SUPER::const_cccmd(@_);
                               $defval =~ s/\$\(OPTIMIZE\)/|
                                       . $no_optimize . q|/gs;
                               print "$defval\n";
                               return $defval;
                       };
               |;
       }
}

my %hash = pdlpp_stdargs_int(@pack);
$hash{LIBS}->[0] .= ' -lm';

undef &MY::postamble; # suppress warning
*MY::postamble = sub {
	pdlpp_postamble_int(@pack);
};

WriteMakefile(%hash);
