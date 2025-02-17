# 🤝 Contributing

Thank YOU for even considering contributing 💖

## Adding content (events/resources/etc)

Content can be added in two different ways:

1. Via the admin site: https://techwerkers.nl/admin
1. Running `decap-server` locally (see heading below) and commiting the changes instead.

> [!INFO]
> The admin site will only be accessible to those that have access to the netlify admin. You can ask for access in our
> slack channel.

### Content Guidelines

General writing guidelines:

- Use plain language wherever you can. We want as many people to be able to
  understand the content as possible.
- Expand acronyms on first use. For example, "Tech Workers Coalition (TWC)"
- Use inclusive language

**Internationalization** - We want to have our site in at least Dutch and English. If you are unable to provide one or the
other, please write in the language you can, and ask for translation help in the `#local-netherlands` Tech Workers Coalition Slack channel.

### Running `decap-server`

Run both of the following

```sh
hugo server
npx decap-server
```

Then open https://localhost:1313/admin in your browser to see the Decap CMS. Any new content/changes will be saved to
disk, so you can commit and make a PR as per normal.

## Developing the site

### Pre-requisites

You will need to have [Hugo](https://gohugo.io/getting-started/installing/) installed first.

Also, we use prettier for formatting.

```sh
npm i  # if you haven't already
npx prettier --write .
```

We have a workflow that will check for prettier things, so please make sure you run before submitting a PR.

### [Re-]Initializing the site

> [!INFO]
> This only needs to be done if you need to generate a `go.mod`. If it already exists you can ignore this.

```shell
hugo mod init github.com/techworkersco/twc-site-nl
```

And for good measure:

```
hugo mod tidy
```

### Developing/Running etc

This is a Hugo site, so it will be similar to editing any other Hugo theme. In general:

1. Check out the repo
1. Run `hugo server` to start the development server
1. Open https://localhost:1313 in your browser
1. Make the changes you need (hugo has live refresh things)
1. Commit your changes, and make a PR.
   - Be sure to add your motivations for the changes in the PR description.
1. Get approval, maintainers will merge when they're happy with the changes.
1. Celebrate 🎉
