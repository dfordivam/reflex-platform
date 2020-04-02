{ haskellLib
, thunkSet
}:
with haskellLib;
let
  localDeps = thunkSet ./dep;

in self: super: {
  # _dep = super._dep or {} // localDeps;
  primitive = appendPatch super.primitive ./primitive.patch;
  jsaddle-webkit2gtk = null;
  mkDerivation = args: super.mkDerivation (args // {
    dontStrip = true;
    enableSharedExecutables = false;
    enableSharedLibraries = false;
    enableDeadCodeElimination = false;
    doHaddock = false;
    doCheck = false;
    enableLibraryProfiling = false;
  });
}

