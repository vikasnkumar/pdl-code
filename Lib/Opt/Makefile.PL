use ExtUtils::MakeMaker;

my @dirs =
  (
   'Simplex',
#   'Golden'    # what is this?
  );

WriteMakefile(
	'NAME' => 'PDL::Opt',
	VERSION_FROM => '../../lib/PDL/Version.pm',
	DIR => [ @dirs ],
    (eval ($ExtUtils::MakeMaker::VERSION) >= 6.57_02 ? ('NO_MYMETA' => 1) : ()),
);

