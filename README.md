# Gem Compare

Reads the lockfile (`Gemfile.lock` by default) diff and posts comments with the output from `gem compare` and `gem compare --diff` for the gems that changed version.

Uses https://rubygems.org/gems/gem-compare (https://github.com/fedora-ruby/gem-compare).

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

With the above workflow, to re-run the action, have Dependabot close and re-open the pull request:

```bash
gh pr comment --body '@dependabot close' NUM
gh pr comment --body '@dependabot reopen' NUM
````
