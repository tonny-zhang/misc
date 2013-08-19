#!/bin/bash

NEWLINE='<br/>';
CURRENT_TIME=$(date +%Y%m%d_%H%M%S);

# must be absolute path
CURRENT_DIR=`dirname $0`
WORK_DIR=`cd $CURRENT_DIR;cd ..;pwd`

# change work directory first
cd $WORK_DIR;
echo "<b>1. cd $WORK_DIR;</b>";
echo $NEWLINE;

# remove modify
echo '<pre>';
git add .
git stash
git stash drop
echo '</pre>';
echo "<b>2. git stash;</b>";
echo $NEWLINE;

# pull source
echo '<pre>';
git pull origin master
echo '</pre>';
echo "<b>3. git pull origin master;</b>";
echo $NEWLINE;

# tag
echo '<pre>';
git tag $CURRENT_TIME;
echo '</pre>';
echo "<b>4. git tag $CURRENT_TIME;</b>";
echo $NEWLINE;

# compress source/* -> min/*
echo '<pre>';
/usr/local/bin/node /home/sam/nodejs/compresser/index.js $WORK_DIR/source $WORK_DIR/min
echo '</pre>';
echo "<b>5. compress finished;</b>";
echo $NEWLINE;

# rsync
echo '<pre>';
# rsync -vaz '-e ssh -p 2222'  $WORK_DIR/min/ sam@61.4.185.220:/home/sam/www/htdocs/n/
echo '</pre>';
echo "<b>6. rsync finished;</b>";
echo $NEWLINE;

echo "<b>7. release finished</b>";