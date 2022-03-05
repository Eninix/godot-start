#!/usr/bin/bash

current_time=`date`
echo $current_time

git add .
echo "= = = = = git add complete = = = = ="

git commit -m "$current_time"
echo "= = = = = git commit complete = = = = ="

git push
