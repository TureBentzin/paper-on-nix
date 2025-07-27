{
  lib,
  stdenvNoCC,
  curl
}:
lib.fetchers.withNormalizedHash
  {
    hashTypes = [
      "sha256"
      "sha512"
    ];
  }
  (
    {
      version,
      outputHash,
      outputHashAlgo,
    }:
    stdenvNoCC.mkDerivation {
      name = "TODO.jar";
      inherit version;

      builder = ./fetchPaper.sh;
      nativeBuildInputs = [
        curl
      ];

      outputHashMode = "flat";
      inherit outputHash outputHashAlgo;

      URL = "";
    }
  )
