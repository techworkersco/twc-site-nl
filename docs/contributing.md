# 🤝 Contributing

> [!WARNING]
> This is out of date at present and will be updated soon

## Add an event

Add a file inside the [`_events`](_events) directory. Copy a previous file as a template, and make sure to include the right time zone for The Netherlands!

## Add a blog post (inside /blog)

Add a file inside the [`_blog`](_blog) directory. Copy a previous file as a template. If an author does not exist, add one inside [`_data/authors.yml`](_data/authors.yml). A name is the only thing necessary, but photo is optional too.

## Add a press mention

Inside [`_data/press.yml`](_data/press.yml) file, add a media entry, with date format in `YYYY-MM-DD`.

## Translation

I18n (internationalization) is made available with the [jekyll-multiple-languages-plugin](https://github.com/kurtsson/jekyll-multiple-languages-plugin/). When a page has a translated version available, a link will show up on the top right if you use the [default_translate](_layouts/default_translate.html) layout. English is the default language, while other languages have their two letter ISO code prefixed, for example [TechWorkersCoalition.org/ru](https://TechWorkersCoalition.org/ru) for Russian.

### Localise date

Normally displaying a date is done using native liquid templates `{{ page.date | date: '%-d %B %Y' }}`, but for localisation, we need to pass it a language which can be done using our custom [\_plugins/i18n_filter.rb](_plugins/i18n_filter.rb), and translation keys. We would replace our liquid template with the following:

`{{ page.date | localize: site.lang, '%-d %B %Y' }}`

### Adding new language

1. Add new language key to [en.yml](_i18n/en.yml)
2. Add two letter iso code in [config](_config.yml). The order here determines the order shown on the page. English must be first.
3. Inside the [i18n](_i18n) directory create a

- `LANGUAGE.yml` with the language key and value in its own language, for example `es: Español`

Note, only the default [en.yml](_i18n/en.yml) must contain the names of each language. The other language yaml files contain just their own language key. To include only certain languages, specify the exact language keys you want. For example `languages: ["en", 'ja']`

## API feeds

Currently [techworkerscoalition.org](https://techworkerscoalition.org) uses Berlin press and events either from GitHub or directly from our exposed APIs e.g [/events.json](https://techwerkers.nl/events.json). You can find other uses cases [here](https://github.com/techworkersco/twc-site/blob/master/_config.yml#L32)

## Supported Pages

- Landing Page [index.yml](../_pages/index.md)
- Join Page [join.md](../_pages/join.md)
- Events [events.md](../_pages/events.md)
- Press mentions [press_mentions.md](../_pages/press_mentions.md)

## Supported Languages

- English
- Nederlands
