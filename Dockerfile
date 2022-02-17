FROM jekyll/jekyll:3.8

# Install ImageMagick
RUN apk --no-cache add \
    file \
    imagemagick

CMD ["jekyll", "--help"]

ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]

WORKDIR /srv/jekyll

VOLUME  /srv/jekyll

EXPOSE 35729
EXPOSE 4000
