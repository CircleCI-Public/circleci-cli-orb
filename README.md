# CircleCI CLI Orb [![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/circleci-cli-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/circleci-cli-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/circleci/circleci-cli.svg)](https://circleci.com/orbs/registry/orb/circleci/circleci-cli) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/CircleCI-Public/circleci-cli-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

Quickly and easily install and configure the [CircleCI command-line interface](https://circleci-public.github.io/circleci-cli/) (CLI), on CircleCI, for [running "local" jobs](https://circleci.com/docs/2.0/local-cli/#run-a-job-in-a-container-on-your-machine) and interacting with CircleCI configuration, orbs, and CircleCI's GraphQL API.

## Usage

_For full usage guidelines, see the [orb registry listing](https://circleci.com/orbs/registry/orb/circleci/circleci-cli)._

## Examples
### executor-command-example
Run a job inside the CircleCI CLI container, via this orb's executor. In another job, use the orb to install the CLI.

```
version: 2.1

jobs:
  use-executor:
    executor: cli/default
    steps:
      - run: echo "this job is using the orb's default executor"
  use-install-command:
    docker:
      - image: 'circleci/circleci-cli:latest'
    steps:
      - cli/install
      - run: echo "the CLI is now installed"
orbs:
  cli: circleci/circleci-cli@x.y.z

workflows:
  cli-orb-example:
    jobs:
      - use-executor
      - use-install-command
```

## Contributing

We welcome [issues](https://github.com/CircleCI-Public/circleci-cli-orb/issues) to and [pull requests](https://github.com/CircleCI-Public/circleci-cli-orb/pulls) against this repository!

For further questions/comments about this or other orbs, visit [CircleCI's orbs discussion forum](https://discuss.circleci.com/c/ecosystem/orbs).
