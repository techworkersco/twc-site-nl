# 🛠️ Installation

> [!WARNING]
> This is out of date at present and will be updated soon

## Formatting

Install prettier and precommit hooks: `npm install`

You can manually run prettier using: `npx prettier . --write`

### Skip pre-commit hooks

1. To skip pre-commit hooks, use `git commit --no-verify` or `git commit -n`
1. Alternatively, you could not run `npm install`; opting to install prettier and the plugin globally via `npm install -g prettier @shopify/prettier-plugin-liquid`

## With Docker (recommended)

We use Docker to have a reproducible development environment.
Before proceeding, install [Docker Compose](https://docs.docker.com/compose/install/) on your system.

1. Make sure you're using node >=20
1. Start the application with the command: `docker-compose up`
1. (Optional) Execute other commands in the Docker container: `docker exec -it twc-site-nl-jekyll-1 /bin/bash`
1. Access the application in a browser at `localhost:4000`

## Without Docker

1. Install dependencies: `bundle install`
1. Start a local server: `bundle exec jekyll serve`
1. Verify all internal links are valid: `bundle exec rake`
1. (Optional) to reproduce Netlify functions run `npx decap-server`; then you can access `/admin` or other Netlify services
1. Access the application in a browser at `localhost:4000`
