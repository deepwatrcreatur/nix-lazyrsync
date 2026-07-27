{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "lazyrsync";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "westpoint-io";
    repo = "lazyrsync";
    rev = "5e9b5f08cb540e355f60fb57d1407fe943718945";
    hash = "sha256-wF28Px/2WorUikAej0146KtzwJV9UGJiNvzmZ5i7wpQ=";
  };

  cargoHash = "sha256-/L6N08TFqwW6yeNFiIUtmz6SxdEuxa6SHMxDoZ4Myl8=";

  meta = with lib; {
    description = "Safe terminal user interface for rsync";
    homepage = "https://github.com/westpoint-io/lazyrsync";
    license = licenses.mit;
    mainProgram = "lazyrsync";
  };
}
