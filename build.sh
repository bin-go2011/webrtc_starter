#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/util.sh

WEBRTC_ROOT=${WEBRTC_ROOT:-""}
OUTDIR=${OUTDIR:-vendor}
CONFIGS=${CONFIGS:-Debug Release}

mkdir -p $OUTDIR
OUTDIR=$(cd $OUTDIR && pwd -P)

detect-platform
TARGET_OS=${TARGET_OS:-$PLATFORM}
TARGET_CPU=${TARGET_CPU:-x64}
echo "Host OS: $PLATFORM"
echo "Target OS: $TARGET_OS"
echo "Target CPU: $TARGET_CPU"

echo Packaging WebRTC
package::prepare $PLATFORM "" $OUTDIR "$CONFIGS"

echo Build successful


