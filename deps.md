# Dependencies

## Random things

Put tree style tabs css in place both in the extension and userChrome in the Firefox profile.
Hard to automate because of randomized profile name.

## Apps

Tried to use `mas` but it breaks `brew bundle --global` more often than not.
Some of these are installed by the `Brewfile` currently though.

### Basics

- Authy Desktop
- Firefox
- Karabiner Elements
- Remember The Milk
- Simplenote

### Development

- Docker Desktop
- Kitty
- MacVim
- Sourcetree
- Table Plus
- VS Code

### Media

- Plex
- Plexamp
- VCV Rack
- Spotify
- Tidal
- Steam

### Chat

- Discord
- Slack
- Telegram

### Utils

- Dash
- Hex Color
- Maccy
- Rectangle

## asdf plugins

```sh
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add terraform
asdf plugin add perl
asdf plugin add golang
```

## Node

- neovim
- clipboard-cli (for cross platform copy / paste to from command line in tmux and git aliases)
- livedown

## Python

- virtual env for neovim / neovim-py2
- virtual env with tools (pip install black autopep8 flake8 glances yamllint sqlfluff)

## Ruby

- teamocil
- neovim
- solargraph?

Set the bundler path

```sh
$ bundle config set path 'vendor/bundle'

$ cat ~/.bundle/config
---
BUNDLE_PATH: "vendor/bundle"
```

## Perl

WTF.

```sh
## Had to do all this
cpanm Net::SSLeay
cpanm IO::Socket::SSL
cpanm Neovim::Ext
cpan App::cpanminus

## Ideally only install this
cpan Neovim::Ext
```
