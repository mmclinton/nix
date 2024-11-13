{ pkgs ? import <nixpkgs> {} }:
  let
    overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
    libPath = with pkgs; lib.makeLibraryPath [
      openssl.dev
      openssl.out
    ];
in
  pkgs.mkShell rec {
    nativeBuildInputs = with pkgs; [
      clang
      llvmPackages.bintools
      rustup
      openssl
      pkg-config
    ];

    RUSTC_VERSION = overrides.toolchain.channel;
    # https://github.com/rust-lang/rust-bindgen#environment-variables
    LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
    shellHook = ''
      export PATH=$PATH:''${CARGO_HOME:-~/.cargo}/bin
      export PATH=$PATH:''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
      export OPENSSL_DIR=${pkgs.openssl}
      export OPENSSL_LIB_DIR=${pkgs.openssl.out}/lib
      export OPENSSL_INCLUDE_DIR=${pkgs.openssl.dev}/include
      export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig:$PKG_CONFIG_PATH
      exec fish
      '';
    RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') [
      pkgs.openssl.out
    ]);
    LD_LIBRARY_PATH = libPath;
    BINDGEN_EXTRA_CLANG_ARGS =
    (builtins.map (a: ''-I"${a}/include"'') [
      pkgs.glibc.dev
      pkgs.openssl.dev
    ])
    ++ [
      ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
      ''-I"${pkgs.glib.dev}/include/glib-2.0"''
      ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
    ];
  } 

