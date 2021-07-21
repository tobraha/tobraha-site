#!/bin/bash

site_name="tobraha-site"
deploy_dir="$PWD/$site_name/public"

# initialize new site
hugo new site $site_name

cp ./config.toml $site_name/
cd $site_name

# add hugo theme as git submodule
git init
git submodule add https://github.com/Yukuro/hugo-theme-shell.git themes/hugo-theme-shell

# build
hugo -D

# fix unicode characters
sed -i 's/└/\\u2514/g' "$deploy_dir/index.html"
sed -i 's/├/\\u251c/g' "$deploy_dir/index.html"
sed -i 's/─/\\u2500/g' "$deploy_dir/index.html"
