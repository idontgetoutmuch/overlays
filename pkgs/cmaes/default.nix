{ mkDerivation, base, doctest, doctest-prop, fetchFromGitHub, mtl, process, random
, safe, stdenv, strict, syb, vector
}:
mkDerivation {
  pname = "cmaes";
  version = "0.2.3";
  src = fetchFromGitHub {
    owner = "idontgetoutmuch";
    repo = "cmaes";
    rev = "71d28e60f845e0c5de154770eaae8f1e2cf68dd6";
    sha256 = "1iah6f12zyzidy71h3z471pwzvpfbm4r1aivvyb21qw4n991i0aj";
  };
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [ base mtl process safe strict syb ];
  testHaskellDepends = [
    base doctest doctest-prop mtl process random syb vector
  ];
  description = "CMA-ES wrapper in Haskell";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
