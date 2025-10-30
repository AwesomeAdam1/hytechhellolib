{ stdenv, cmake }:

stdenv.mkDerivation {
  pname = "hellolib";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [ ];
}