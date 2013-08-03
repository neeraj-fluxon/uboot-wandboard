#!/bin/sh
#
# Builds Debian package.

# Clean up
git clean -df

# Make distribution files.

# Build
dpkg-buildpackage


