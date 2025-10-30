{ stdenv, cmake }:

stdenv.mkDerivation {
  pname = "hellolib";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [ ];

  installPhase = ''
    mkdir -p $out/include
    mkdir -p $out/lib
    cp -r include/* $out/include/
    cp libhellolib.a $out/lib/
  '';
}