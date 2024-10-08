# Dependencies

Install password manager.

Open up Terminal and install brew.

Put these dotfiles in place then:

```
$ brew bundle --global
```

## Random things

Put css in place in userChrome in the Firefox profile.

- Set the `toolkit.legacyUserProfileCustomizations.stylesheets` to true in `about:config`
- Create a chrome folder: `~/Library/Application Support/Firefox/Profiles/xxxxxx.default-release/chrome`
  - and also in `dev-edition-default` if Firefox Developer Edition is installed
- Symlink `userChrome.css` into `chrome/.`

Hard to automate because of randomized profile name.

## asdf plugins

```sh
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add terraform
asdf plugin add perl
asdf plugin add golang
asdf plugin add rust

asdf install
```

## Apps

### Development

- VS Code

### Chat

- Slack
- Telegram

### Utils

- Dash
- Hex Color
- LogiOptions+ for mice
- Logitune for cameras
- Carbon Copy Cloner
- Teensy
- Toast 20
- Garmin Express

### Art Stuff

- Digital Performer
- Loopback
- Audio Hijack
- OBS
- iLok
- MoogerFooger Effects
- VCV Rack
- Blackmagic Video Driver (Desktop Video)
- Boss DD-500 editor
- TR-8S editor
- Roland Cloud Manager
- Focusrite tools
- FH-2 configurator
- MidiKeys
- MIDI Monitor
- MidiPipe
- Sysex Librarian
- VLC
- Arturia Software Center
- Arturia MIDI Control Center
- Soundtoys Little Radiator

## Node

- neovim
- clipboard-cli (for cross platform copy / paste to from command line in tmux and git aliases)
- livedown

## Python

- virtual env for neovim / neovim-py2
- virtual env with tools (pip install black autopep8 flake8 glances yamllint sqlfluff neovim-remote)

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
