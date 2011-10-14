use 5.008001;
use strict;
use warnings;
use Module::Build;

my %supported = map { ( $_ => 1 ) } qw/linux solaris freebsd gnukfreebsd darwin MSWin32/;

my $implementation = $supported{$^O} ? 'Sys::Sendfile' : 'File::Map';

my $module_build_args = {
  "build_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "IO::Socket::INET" => 0,
    "Module::Build" => "0.3601",
    "Socket" => 0,
    "Test::More" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Sending files over a socket efficiently and cross-platform",
  "dist_author" => [
    "Leon Timmermans <leont\@cpan.org>"
  ],
  "dist_name" => "File-Send",
  "dist_version" => "0.001",
  "license" => "perl",
  "module_name" => "File::Send",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Fcntl" => 0,
    "Sub::Exporter" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
};
;
$module_build_args->{requires}{$implementation} = 0;

my $builder = Module::Build->new(
	%$module_build_args,
);

$builder->create_build_script();

