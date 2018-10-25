#!/bin/sh

# Build site in production mode
JEKYLL_ENV=production bundle exec jekyll build

# Verify there are no dead links
bundle exec htmlproofer --assume-extension --disable-external --url-ignore "#,#fn:1" ./_site
