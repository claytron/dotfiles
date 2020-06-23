## Stuff I use a lot

### ZSH

- [Whole line completion][zsh-whole-line-completion]
- [Syntax highlighting][zsh-syntax-highlight]
- [Global aliases][zsh-global-alias]
- [vi style modes][zsh-vi-mode]
- [Auto pushd and directory navigation][zsh-auto-pushd], see this [stackoverflow answer][zsh-auto-pushd-so] for more details

### Git

- [Rebasing helpers][git-rebase-helpers]
- [Conflict helper][git-conflict-helpers]
- [Branch switching][git-branch-switching]
- [Diffing][git-diffing]
- [wip / ammend][git-wip-ammend]
- [up / upd / upm][git-pull-helpers]
- [Pristine version of remote branch][git-pristine]

### Vim

- [No leader for key bindings][vim-no-leader]
- [Quick file type switching][vim-file-type-switch]
- [Use sane regex by default][vim-search-regex]
- Levels of searching `/` to `////`
  - [Single tap][vim-search-regex] vim search of the current buffer
  - [Double tap][vim-search-git] git grep search of all files
  - [Triple tap][vim-search-alt] search with grep alike (ack, rg or ag)
  - [Quad tap][vim-search-help] search help files with regex
- [Quick window / buffer switching][vim-window-switching]

### tmux

Default key bindings are awful, read the [Brian Hogan book][tmux-hogan-book] for some better ideas.
It may be slightly out of date now, but still very helpful.

Also take a look at my [tmux.conf][tmux-conf].

[//]: # ( Links )
[zsh-whole-line-completion]: https://github.com/claytron/dotfiles/blob/meetup-talk/.zshrc#L90-L110
[zsh-syntax-highlight]: https://github.com/claytron/dotfiles/blob/meetup-talk/.zshrc#L212
[zsh-global-alias]: https://github.com/claytron/dotfiles/blob/meetup-talk/.zshrc#L14-L64
[zsh-vi-mode]: https://github.com/claytron/dotfiles/blob/meetup-talk/.zshrc#L121-L162
[zsh-auto-pushd]: https://github.com/claytron/dotfiles/blob/meetup-talk/.zshrc#L71-L76
[zsh-auto-pushd-so]: https://stackoverflow.com/questions/3986760/cd-1-2-3-etc-in-z-shell/4740090#4740090
[git-rebase-helpers]: https://github.com/claytron/dotfiles/blob/meetup-talk/.gitconfig#L100-L105
[git-conflict-helpers]: https://github.com/claytron/dotfiles/blob/meetup-talk/.gitconfig#L110-L112
[git-branch-switching]: https://github.com/claytron/dotfiles/blob/meetup-talk/.gitconfig#L56-L64
[git-diffing]: https://github.com/claytron/dotfiles/blob/meetup-talk/.gitconfig#L66-L85
[git-wip-ammend]: https://github.com/claytron/dotfiles/blob/meetup-talk/.gitconfig#L37-L39
[git-pull-helpers]: https://github.com/claytron/dotfiles/blob/meetup-talk/.gitconfig#L43-L47
[git-pristine]: https://github.com/claytron/dotfiles/blob/meetup-talk/.gitconfig#L65
[vim-no-leader]: https://github.com/claytron/dotfiles/blob/meetup-talk/.vimrc#L10-L96
[vim-file-type-switch]: https://github.com/claytron/dotfiles/blob/meetup-talk/.vimrc#L271-L282
[vim-search-regex]: https://github.com/claytron/dotfiles/blob/meetup-talk/.vimrc#L266-L268
[vim-search-git]: https://github.com/claytron/dotfiles/blob/meetup-talk/.vimrc#L769
[vim-search-alt]: https://github.com/claytron/dotfiles/blob/meetup-talk/.vimrc#L768
[vim-search-help]: https://github.com/claytron/dotfiles/blob/meetup-talk/.vimrc#L269
[vim-window-switching]: https://github.com/claytron/dotfiles/blob/meetup-talk/.vimrc#L1280-L1317
[tmux-hogan-book]: https://pragprog.com/titles/bhtmux2/
[tmux-conf]: https://github.com/claytron/dotfiles/blob/meetup-talk/.tmux.conf
