my $malloclib = $PDL::Config{MALLOCDBG}->{libs};
my $mallocinc = $PDL::Config{MALLOCDBG}->{include};

use PDL::Core::Dev;
use ExtUtils::MakeMaker;
WriteMakefile(
 'NAME'	        => 'PDL::CallExt',
 'VERSION_FROM' => '../../lib/PDL/Version.pm',
 'INC' => PDL_INCLUDE() . " $mallocinc",
 'LIBS' => [$malloclib],
);
