"""Some random fabric tasks to make my life easier.
"""
from fabric.api import run
from fabric.api import env
from fabric.api import local
from fabric.utils import abort
from fabric.contrib.files import exists

env.dotfiles = 'https://svn.sixfeetup.com/svn/private/claytron/dotfiles/trunk'
env.dotfiles_local = "$HOME/.dotfiles"


def push_dotfiles(rsync=None, dry=None, port=None):
    """Push my dotfiles to a specific server

    rsync::
      If this option is passed, do an rsync instead of trying to
      check out from svn.
    dry::
      Pass the dry-run option to rsync
    """
    # run this to expose potential issues with the machine like
    # bash not being in /bin/bash
    run("echo $HOME")
    if not exists("$HOME"):
        abort("You do not appear to have a home directory")
    # Only bail out if we are doing a checkout
    if rsync is None and exists(".dotfiles"):
        abort("The .dotfiles directory already exists")
    if rsync is None:
        run('svn co %s .dotfiles' % env.dotfiles)
    else:
        options = []
        if dry is not None:
            options.append('-n')
        if port is not None:
            options.append("--port=%s" % port)
        # rsync to the host deleting files that don't exist here
        # TODO: use built-in fabric command?
        # NOTE: I still use svn as the main repo, so ignore git
        local('rsync %s -av --delete --exclude=".git" %s/ %s:.dotfiles' % (
            ' '.join(options), env.dotfiles_local, env.host_string))
    run('.dotfiles/create_links.sh remove')
    run('.dotfiles/create_links.sh')


def remove_dotfiles(ignore=None):
    """Remove my dotfiles from a specific server
    """
    # run this to expose potential issues with the machine like
    # bash not being in /bin/bash
    run("echo $HOME")
    if not exists("$HOME"):
        abort("You do not appear to have a home directory")
    if not exists(".dotfiles"):
        abort("The .dotfiles directory does not exist")
    output = run("svn st .dotfiles")
    msg = "There are local changes, commit or revert before continuing"
    if output and ignore is None:
        abort(msg)
    run('svn up .dotfiles')
    run('.dotfiles/create_links.sh cleanup')
    run('rm -rf .dotfiles')
