#!/bin/bash
set -e

# Clone Mkdocs Repo
git clone https://github.com/albertov19/wormhole-mkdocs.git

mkdir -p wormhole-mkdocs/wormhole-docs

# Move files
shopt -s extglob
cp -R !(wormhole-mkdocs|build.sh) wormhole-mkdocs/wormhole-docs/

# Install Python dependencies (no sudo needed)
pip3 install --user -r wormhole-mkdocs/requirements.txt

# Add ~/.local/bin to PATH so mkdocs can be found
export PATH="$HOME/.local/bin:$PATH"

cd wormhole-mkdocs
mkdocs build -d ./site
