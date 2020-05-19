Docker Pronto Credo
===================

This image enables to run Pronto with Credo runner in single container.

This image includes below:

- [pronto](https://github.com/prontolabs/pronto)
- [pronto-credo](https://github.com/carakan/pronto-credo)
- [credo](https://github.com/rrrene/credo)

This image is based on `elixir:1.9.1-slim` for installing and running Credo.
Additionally Ruby 2.7.1 is installed for installing and running Pronto.

## Example usage

```sh
docker run --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  -e PRONTO_GITHUB_ACCESS_TOKEN=... \
  -e PRONTO_PULL_REQUEST_ID=... \
  yuukiaria/pronto-credo run -f github_pr_review -c origin/master
```

This image is intended to used in container-based CI system like as Concourse CI, Google Cloud Build, and so on.

Note that Pronto runs some git operation so that `.git` directory needs to be accessible in a container.
