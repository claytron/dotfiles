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
- LogiOptions+ for mice
- Carbon Copy Cloner
- Teensy
- Toast 20

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
