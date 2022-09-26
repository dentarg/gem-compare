# Gem Compare

For pull requests with a title matching `/Bump (.+) from (.+) to (.+)/`, it posts a comment with the output from `gem compare` and `gem compare --diff`. Uses https://rubygems.org/gems/gem-compare (https://github.com/fedora-ruby/gem-compare).

To use in your repo, add a workflow like this:

````yaml
name: Gem Compare

on:
  pull_request_target:
    types:
      - opened
      - reopened

permissions:
  contents: read
  pull-requests: write

jobs:
  compare:
    if: github.actor == 'dependabot[bot]' && startsWith(github.head_ref, 'dependabot/bundler/')
    runs-on: ubuntu-latest
    steps:
      - uses: dentarg/gem-compare@v1
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
````
