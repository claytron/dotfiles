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

Here is how I typically set up my shell on a new system.

```sh
$ git clone https://github.com/claytron/dotfiles.dotfiles
$ .dotfiles/create_links.sh
linking .screenrc
linking .vimrc
linking .zshenv
linking .zshprompt
linking .zshprompt_simple
linking .zshrc
linking .inputrc
linking .bash_profile
linking .bashrc
linking .commonrc
linking .commonenv
linking .commonprofile
Remove /home/clayton/.subversion/config so that it can be linked
linking .pystartup
```

Notice that it says the .subversion/config is in the way.
So let's fix that.

```sh
$ rm .subversion/config
$ .dotfiles/create_links.sh
linking config
```

Now we are all set.
Next time we log in the confs will be updated so that any new changes are added.

```sh
$ ssh some-machine

dotfiles updated:
U .dotfiles/.bashrc
At revision 10712.
```

This puts the latest confs are in place and activates the changes.

```sh
$ create_links.sh && source ~/.zshrc
```

If you ever want to remove all the symlinks you can use the `create_links.sh` script by passing it the `remove` argument.

```sh
$ .dotfiles/create_links.sh unlink
Unlinked /home/clayton/.screenrc
Unlinked /home/clayton/.vimrc
Unlinked /home/clayton/.zshenv
Unlinked /home/clayton/.zshprompt
Unlinked /home/clayton/.zshprompt_simple
Unlinked /home/clayton/.zshrc
Unlinked /home/clayton/.inputrc
Unlinked /home/clayton/.bash_profile
Unlinked /home/clayton/.bashrc
Unlinked /home/clayton/.commonrc
Unlinked /home/clayton/.commonenv
Unlinked /home/clayton/.commonprofile
Unlinked /home/clayton/.commonfuncs
Unlinked /home/clayton/.subversion/config
Unlinked /home/clayton/.pystartup
```

In addition to the `remove` argument there is `cleanup`.
This will not only remove all the symlinks, but it will also remove all the other items created by the script.
This can be slightly dangerous since that includes **everything**, including unversioned files.
