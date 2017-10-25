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

  # find and copy header files
#   pushd src >/dev/null
#   local headersSourceDir=$srcdir
#   local headersDestDir=$outdir/include
#   find $headersSourceDir -name '*.h' -exec $CP --parents '{}' $headersDestDir ';'
#   popd >/dev/null

  # find and copy libraries
#   pushd src/out >/dev/null
#   find . -maxdepth 3 \( -name '*.so' -o -name '*.dll' -o -name '*webrtc_full*' -o -name *.jar \) \
#     -exec $CP --parents '{}' $outdir/$package_filename/lib ';'
#   popd >/dev/null

  popd >/dev/null
}
