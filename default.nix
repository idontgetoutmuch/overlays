self: super:
let
  pythonOverlay = pself: psuper:
  {
    sundials_3_lapack = pself.callPackage ./pkgs/sundials { };
    myScikits-odes = pself.callPackage ./pkgs/scikits-odes { };
};
  haskellOverlay = hself: hsuper:
  {
    my-random-fu-multivariate = hself.callPackage ./pkgs/random-fu-multivariate { };
};
in {
  python37Packages = super.python37Packages.override { overrides = pythonOverlay; };
  haskell = super.haskell // { packages =
	    super.haskell.packages // { ghc864 =
	      super.haskell.packages.ghc864.override { overrides = haskellOverlay; }; };
	  };
}
