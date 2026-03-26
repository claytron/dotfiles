# Dependencies

## Random things

Put css in place in userChrome in the Firefox profile.

- Set the `toolkit.legacyUserProfileCustomizations.stylesheets` to true in `about:config`
- Create a chrome folder: `~/Library/Application Support/Firefox/Profiles/xxxxxx.default-release/chrome`
  - and also in `dev-edition-default` if Firefox Developer Edition is installed
- Symlink `userChrome.css` into `chrome/.`

Hard to automate because of randomized profile name.

## Apps

### Utils

- Dash
- Carbon Copy Cloner
- Toast 20

### Art Stuff

- Digital Performer
- MoogerFooger Effects
- VCV Rack
- Blackmagic Video Driver (Desktop Video)
- Boss DD-500 editor
- TR-8S editor
- Roland Cloud Manager
- FH-2 configurator
- MidiPipe
- Arturia MIDI Control Center
- Soundtoys Little Radiator

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
