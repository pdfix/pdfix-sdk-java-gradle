#!/bin/bash

# set the current directory
pushd "$(dirname $0)"

SDK_VER=8.1.5
SDK_HASH=7fe88bf7

arch=$(uname -m)

# identify platform and pdfix sdk file names
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  SDK_ZIP="pdfix_sdk_"$SDK_VER"_"$SDK_HASH"_linux"_"$arch.tar.gz"
  EXTRACT="tar -xzvf"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  SDK_ZIP="pdfix_sdk_"$SDK_VER"_"$SDK_HASH"_macos"_"$arch.zip"
  EXTRACT=unzip
elif [[ "$OSTYPE" == "msys" ]]; then
  SDK_ZIP="pdfix_sdk_"$SDK_VER"_"$SDK_HASH"_windows"_"$arch.zip"
  EXTRACT=unzip
else
  echo "error: unknown platform"
  exit 1
fi

# download and unpack the PDFix SDK for this platform

echo "Downloading PDFix SDK for $OSTYPE $arch"
SDK_URL="https://github.com/pdfix/pdfix_sdk_builds/releases/download/$SDK_VER/$SDK_ZIP"

PDFIX_DIR=app/pdfix
rm -rf $PDFIX_DIR
mkdir -p $PDFIX_DIR                    && \
pushd $PDFIX_DIR                       && \
curl -L -sS $SDK_URL > $SDK_ZIP        && \
$EXTRACT $SDK_ZIP                      && \
rm $SDK_ZIP
popd  # PDFIX_DIR

# download and install the *.jar file
LIBS_DIR="app/libs"
JAR_FILE="net.pdfix.pdfixlib-$SDK_VER.jar.zip"
JAR_URL="https://github.com/pdfix/pdfix_sdk_builds/releases/download/$SDK_VER/$JAR_FILE"
mkdir -p $LIBS_DIR && \
pushd $LIBS_DIR && \
curl -L -sS $JAR_URL > $JAR_FILE && \
unzip $JAR_FILE && \
rm $JAR_FILE
popd  # $LIBS_DIR

popd  # current directory
