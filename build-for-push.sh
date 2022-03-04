#!/usr/bin/bash

mdbook build
echo "= = = = = build complete = = = = ="
rm -rf ./book/.git
rm ./book/.gitignore
echo "= = = = = .git have been deleted = = = = ="
cp SUMMARY.md SUMMARY.md.bak
