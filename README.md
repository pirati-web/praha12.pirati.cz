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

macOS: ImageMagic nainstalovat pomocí Homebrew

Po updatu na novou verzi jekylltheme (editace čísla verze v Gemfile a _config.yml):

```
bundle install
```

- - -

Spuštění (na adrese http://127.0.0.1:4000/):

```
bundle exec jekyll serve
```

- - -

### Obvyklé problémy při zprovoznění na svém počítači

* Možná máš jinou verzi Ruby, než očekává pirátský web. Tam je natvrdo 2.5.0. Podívej se u sebe do adresáře `vendor/bunde/ruby`, jaký adresář tam máš, a podle toho uprav řádek dole v `_config.yml`. Hlavně tu změnu prosím necommituj.

* Možná ti nejde web zbuildovat, hází to divné chyby. U mne pomáhá, když si v souboru `Gemfile` nahoře pod řádkem s verzí Jekyllu dám řádek `gem "mini_racer"`. Ani tuto změnu prosím necommituj.
