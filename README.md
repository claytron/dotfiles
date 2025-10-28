# README

All of these confs were compiled by Clayton Parker, aka claytron.
Most of the confs have comments describing why/what is happening.

## Caveats

I would strongly urge you not to use my confs directly.
I am very picky about things, and this would certainly drive you crazy.

Another item of note is that I use vi editing mode in every place that will allow me to.
This is set in the `.inputrc` and `.zshrc`.
This would likely throw most people off as they are used to the emacs mode.
The only issue I've run into with the vi mode is when you move from the end of the line in insert mode.
When you try and go back to the end you can't without going to command mode and using `a` to add to the line.

## A little history

To start off, here is a little background.
Here in lies years of craziness all compiled into one nice little folder.
I've been using the command line since 2003 when I was given a job as a systems administrator.
I started on ZSH and have been using it ever since.
At some point I decided to compile a set of confs that could be used with either ZSH or Bash (since most machines have at least bash).

## Usage in the wild

These configs use [chezmoi](https://www.chezmoi.io/) to manage installation.

### Install

Bare minimum software needed is [1password](https://1password.com/downloads/mac) with ssh key integration on.

On macOS, open up Terminal and run a git command to have XCode install command line tools:

```sh
$ git status
```

Optionally set the bonjour and computer name:

```sh
$ sudo scutil --set LocalHostName something
$ sudo scutil --set ComputerName something
```

Prep for the chezmoi install, by getting config in place (install depends on this `data`):

```sh
mkdir -p ~/.config/chezmoi

cat << EOF > ~/.config/chezmoi/chezmoi.toml
[data]
work = false
EOF
```

Then install chezmoi with the following command:

```sh
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh claytron/dotfiles
```

### Update

```sh
$ chezmoi update
```
