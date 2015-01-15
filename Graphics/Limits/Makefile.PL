
# Makefile.PL for PDL::Graphics::PGPLOT module.

# Use this as a template for the Makefile.PL for
# any external PDL module.	

use ExtUtils::MakeMaker;


WriteMakefile(
	      'NAME'  	=> 'PDL::Graphics::Limits',
	      'VERSION_FROM' => '../../lib/PDL/Version.pm',
    (eval ($ExtUtils::MakeMaker::VERSION) >= 6.57_02 ? ('NO_MYMETA' => 1) : ()),
);

