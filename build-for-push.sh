#!/usr/bin/bash

mdbook build
echo "= = = = = build complete = = = = ="

rm -rf ./book/.git
rm ./book/.gitignore
echo "= = = = = .git file that have been deleted = = = = ="

cp SUMMARY.md SUMMARY.md.bak

rm -rf ./book/zfoo
rm -rf ./book/script
rm -rf ./book/scene
rm -rf ./book/gdTest
rm -rf ./book/gdProtocol
echo "= = = = = Nonregard file that have been deleted = = = = ="