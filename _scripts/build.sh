#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build
#bundle exec htmlproofer --help
#bundle exec htmlproofer ./_site
bundle exec htmlproofer ./_site --disable-external --alt-ignore '/.*/'
