# Docker local development environment

## Setup

Requirements:

* macOS (haven't tested on other platforms)
* [Docker for Mac](https://docs.docker.com/docker-for-mac/)
* [docker-sync](http://docker-sync.io)

```sh
docker-sync start
docker-compose build

docker-compose run --rm ruby bundle install

docker-compose up -d
docker-compose ps
```

## Usage

Run all commands through the Ruby container. Examples:

```sh
docker-compose exec ruby rspec
docker-compose exec ruby robot commands.txt
```

## Recommended Zsh aliases

<https://github.com/akarzim/zsh-docker-aliases>

```sh
# Docker
alias dksyn='docker-sync'
alias dksynr='dksyn stop && dksyn start'
alias down='dkcd; dksyn clean'
alias dr='dkce ruby'
alias start='dksyn start &; dkcU &; wait'
alias stop='dksyn stop &; dkcx &; wait'
alias up='dksyn start; dkcU'
```
