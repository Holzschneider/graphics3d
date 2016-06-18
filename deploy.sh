#!/bin/bash

#rm -rf $HOME/deploy
git clone -b deploy https://${GH_TOKEN}@github.com/holzschneider/graphics3d $HOME/deploy

mvn package
mvn install:install-file -DpomFile=pom.xml -Dfile=$(ls target/*.jar) -DlocalRepositoryPath=$HOME/deploy

cd $HOME/deploy

git add .
git commit -m "travis"
git push -f origin deploy