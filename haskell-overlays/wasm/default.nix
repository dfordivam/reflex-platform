{ haskellLib }:

self: super: {
  jsaddle-warp = null;
  jsaddle-webkitgtk = null;
  jsaddle-webkit2gtk = null;
  jsaddle-wkwebview = null;
  reflex-dom = haskellLib.enableCabalFlag super.reflex-dom "wasm32";
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

