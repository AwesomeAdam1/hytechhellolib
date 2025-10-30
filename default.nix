{ stdenv
, cmake
}:

stdenv.mkDerivation rec {
  pname = "hellolib";
  version = "1.0.0";
  src = ./.;

  nativeBuildInputs = [ cmake ];

  # CMakeLists already installs headers and package config
  # No extra phases needed; standard cmake hooks will run.
}