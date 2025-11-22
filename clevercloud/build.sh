#!/bin/bash

set -e

echo "Installing Hugo ${HUGO_VERSION}..."

# Download and install Hugo
HUGO_VERSION="0.152.2"
HUGO_DOWNLOAD="hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"

cd /tmp
wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_DOWNLOAD}
tar -xzf ${HUGO_DOWNLOAD}
chmod +x hugo
mv hugo /usr/local/bin/

echo "Hugo installed successfully"
hugo version

# Build the site
cd $APP_HOME
echo "Building Hugo site..."
hugo --minify --gc

echo "Build complete!"
