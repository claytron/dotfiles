#!/usr/bin/env bash

asdf plugin add nodejs || true
asdf plugin add python || true
asdf plugin add ruby || true
asdf plugin add terraform || true
asdf plugin add perl || true
asdf plugin add golang || true
asdf plugin add rust || true

asdf plugin update --all

asdf install
