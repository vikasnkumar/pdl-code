use ExtUtils::MakeMaker;
WriteMakefile(
   NAME	=> 'PDL::NiceSlice',
   VERSION_FROM => 'lib/PDL/NiceSlice.pm',
   PREREQ_PM => {
      Filter::Util::Call => 0,
      Text::Balanced => 0,
      PDL => 2.003000,
   },
   clean => { FILES => 'README' },
);

sub MY::postamble {
"
README : README.head lib/PDL/NiceSlice.pm
\t\$(CP) README.head README
\tpod2text lib/PDL/NiceSlice.pm >> README

create_distdir : README
";
}
