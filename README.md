# praha12.pirati.cz

[![Build Status](https://api.travis-ci.org/pirati-web/praha12.pirati.cz.svg?branch=gh-pages)](https://travis-ci.org/pirati-web/praha12.pirati.cz)

- - -

[Návod](https://github.com/pirati-web/jekyll-theme-pirati/blob/master/USAGE.md) na nastavení a používaní jednoduchého webu nad `jekyll-theme-pirati`

1. naklonovat repository
2. nainstalovat Ruby (pokud třeba) - viz návod na [JekyllRB](https://jekyllrb.com/docs/installation/windows/)

```
gem install jekyll bundler
bundle install --path vendor/bundle
```

macOS: ImageMagic nainstalovat pomocí homebrew

Po updatu na novou verzi jekylltheme (editace čísla verze v Gemfile a _config.yml):

```
bundle install
```

- - -

Spuštění:

```
jekyll serve
```

nebo (je-li nainstalována systémová i lokální verze bundleru, které se pak bijí)

```
bundle exec jekyll serve
```
