#! /bin/bash
set -e

# Clone Upstream
git clone https://github.com/fzwoch/obs-vaapi
cp -rvf ./debian ./obs-vaapi/
cd ./obs-vaapi

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
