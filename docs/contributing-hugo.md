# 🤝 Contributing

## Pre-requisites

You will need to have [Hugo](https://gohugo.io/getting-started/installing/) installed on your machine.

## [Re-]Initializing the site

> [!INFO]
> This only needs to be done if you need to generate a `go.mod`. If it already exists you can ignore this.

```shell
hugo mod init github.com/techworkersco/twc-site-nl
```

And for good measure:

```
hugo mod tidy
```

## Buidling and developing the site

1. Check out the repo
1. Run `hugo server` to start the development server
1. Open https://localhost:1313 in your browser
1. Make the changes you need, commit them back
1. Open a PR
1. Get approval, get it merged
1. Celebrate 🎉
