# Berlin TWC

This repository is responsible for most content visible on the website [TechWorkersBerlin.com](https://TechWorkersBerlin.com). The site is made with a static site generator called [Jekyll](https://jekyllrb.com/) in a language called Ruby.

## Getting Started

1. Install dependencies: `bundle install`
2. Start a local server: `bundle exec jekyll serve`
3. Verify all internal links are valid: `bundle exec rake`

Open a browser to localhost:8080

## Add an event

Add file inside the [`_events`](_events) directory. Copy a previous file as a template, and make sure to include the right time zone for Berlin!

## Translation

I18n (internationalization) is made available with the [jekyll-multiple-languages-plugin](https://github.com/kurtsson/jekyll-multiple-languages-plugin/). When a page has a translated version available, a link will show up on the top right if you use the [default_translate](_layouts/default_translate.html) layout. English is the default language, while other languages have their two letter ISO code prefixed, for example [TechWorkersCoalition.org/ru](https://TechWorkersCoalition.org/ru) for Russian.

### Adding new language
1. Add new language key to [en.yml](_i18n/en.yml)
2. Add two letter iso code in [config](_config.yml). The order here determines the order shown on the page. English must be first.
3. Inside the [i18n](_i18n) directory create a
  - `LANGUAGE/` directory (where LANGUAGE is two letter ISO code for that language)
  - `LANGUAGE.yml` with the language key and value in its own language, for example `es: Español`

Note, only the default [en.yml](_i18n/en.yml) must contain the names of each language. The other language yaml files contain just their own language key.

![Screen Shot 2019-07-21 at 14 48 46](https://user-images.githubusercontent.com/7111514/61591397-cb0cd180-abc6-11e9-9876-1577d5c8b4bd.png)

### Supported Pages
* Landing Page (home.html in each Language directory)

### Supported Languages
* English
