function detect-platform() {
  # set PLATFORM to android on linux host to build android
  case "$OSTYPE" in
  darwin*)      PLATFORM=${PLATFORM:-mac} ;;
  linux*)       PLATFORM=${PLATFORM:-linux} ;;
  win32*|msys*) PLATFORM=${PLATFORM:-win} ;;
  *)            echo "Building on unsupported OS: $OSTYPE"; exit 1; ;;
  esac
}

function package::prepare() {
  local platform="$1"
  local srcdir="$2"
  local outdir="$3"
  local configs="$4"

  if [ $platform = 'mac' ]; then
    CP='gcp'
  else
    CP='cp'
  fi
  pushd $outdir >/dev/null
  # create directory structure
  mkdir -p include lib
  for cfg in $configs; do
    mkdir -p lib/$cfg
  done
  popd >/dev/null

  # find and copy header files
  pushd $srcdir >/dev/null
  local headersSourceDir=.
  local headersDestDir=$outdir/include
  find $headersSourceDir -name '*.h' -exec $CP --parents '{}' $headersDestDir ';'
  popd >/dev/null

  # find and copy libraries
  for cfg in $configs; do
    pushd $srcdir/out/$cfg/obj >/dev/null
    find . \( -name '*.a' -o -name '*.dll' -o -name '*.so' -o -name *.jar \) \
        -exec $CP --parents '{}' $outdir/lib/$cfg ';'
    popd >/dev/null
  done

}
