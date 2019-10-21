{ stdenv, pkgconfig, autoreconfHook, fuse }:

stdenv.mkDerivation {
  name = "pifs";

  src = ../.;

  preConfigure = ''
    export PKG_CONFIG=${pkgconfig}/bin/pkg-config
    export FUSE_CFLAGS="-I ${fuse}/include/fuse"
    export FUSE_LIBS="-L ${fuse}/lib -lfuse"
  '';

  nativeBuildInputs = [ pkgconfig autoreconfHook ];

  propagatedBuildInputs = [ fuse ];

  NIX_CFLAGS_COMPILE = ''
    -D_FILE_OFFSET_BITS=64
  '';

  meta = with stdenv.lib; {
    description = "Data-free filesystem";
    homepage = "https://github.com/philipl/pifs";
    license = licenses.gpl3;
    maintainers = with stdenv.lib.maintainers; [ chessai ];
    platforms = platforms.linux;
  };
}
