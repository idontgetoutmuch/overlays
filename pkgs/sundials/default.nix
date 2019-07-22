{ cmake, fetchurl, python, stdenv,
  openblas, liblapack,
  gfortran }:

stdenv.mkDerivation rec {

  pname = "sundials";
  version = "3.2.1";

  src = fetchurl {
    url = "https://computation.llnl.gov/projects/${pname}/download/${pname}-${version}.tar.gz";
    sha256 = "0238r1qnwqz13wcjzfsbcfi8rfnlxcjjmxq2vpf2qf5jgablvna7";
  };


  cmakeFlags = [
    "-DEXAMPLES_INSTALL_PATH=${placeholder "out"}/share/examples"
    "-DSUNDIALS_INDEX_TYPE=int32_t"
    "-DLAPACK_ENABLE=ON"
    "-DLAPACK_LIBRARIES=[${liblapack}/lib/liblapack.dylib,${openblas}/lib/libopenblas.dylib,${gfortran.cc.lib}/lib/libgfortran.a]"
  ];

  nativeBuildInputs = [ cmake gfortran.cc.lib openblas liblapack];
  buildInputs = [ python gfortran ];

  meta = with stdenv.lib; {
    description = "Suite of nonlinear differential/algebraic equation solvers";
    homepage    = https://computation.llnl.gov/projects/sundials;
    platforms   = platforms.all;
    maintainers = [ maintainers.idontgetoutmuch ];
    license     = licenses.bsd3;
  };

}
