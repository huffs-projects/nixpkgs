{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "themectl";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "huffs-projects";
    repo = "themectl";
    rev = "v${version}";
    sha256 = "sha256-lwiq+nQDGKTKglwyU0Yf9Th3DQAzWvqGnbyBCDgrB7A=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = with lib; {
    description = "A unified theming solution for Linux applications";
    longDescription = ''
      themectl reads TOML theme definitions and generates configuration files
      for 13+ applications including Kitty, Waybar, Hyprland, Neovim, Starship,
      Mako, and more. It provides a unified theming solution for Linux
      applications with support for auto-apply, backup safety, validation,
      and Nix/Home Manager integration.
    '';
    homepage = "https://github.com/huffs-projects/themectl";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ Huff Mullen ];
    platforms = platforms.unix;
    mainProgram = "themectl";
  };
}
