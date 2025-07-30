{
  lib,
  stdenvNoCC,
  wget
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
      build,
      contact,
      host,
      outputHash,
      outputHashAlgo,
    }:
    stdenvNoCC.mkDerivation {
      name = "paper-${version}-${build}.jar";
      inherit version;

      builder = ./fetchPaper.sh;
      nativeBuildInputs = [
        wget
      ];

      outputHashMode = "flat";
      inherit outputHash outputHashAlgo;

      # Variables
      inherit wget build contact host;
    }
  )
