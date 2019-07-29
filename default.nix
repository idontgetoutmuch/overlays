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
    my-cmaes = self.haskell.lib.dontCheck (hself.callPackage ./pkgs/cmaes { });
};
in {
  python37Packages = super.python37Packages.override { overrides = pythonOverlay; };
  haskell = super.haskell // { packages =
	    super.haskell.packages // { ghc864 =
	      super.haskell.packages.ghc864.override { overrides = haskellOverlay; }; };
	  };
  haskellPackages = super.haskellPackages.override { overrides = haskellOverlay; };
}
