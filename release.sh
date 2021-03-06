#!/usr/bin/env bash
git checkout develop
mvn jgitflow:release-start && \
 mvn jgitflow:release-finish -DnoDeploy=true && \
 conventional-changelog -p angular -i CHANGELOG.md -s -r 0 && \
 git add CHANGELOG.md && \
 git commit -m "Changelog" && \
 git checkout master && \
 git merge develop && \
 git push origin master && git push --tags && \
 git checkout develop

