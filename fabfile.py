"""Some random fabric tasks to make my life easier.
"""
from fabric.api import run
from fabric.api import env
from fabric.utils import abort
from fabric.contrib.files import exists

env.dotfiles = 'https://svn.sixfeetup.com/svn/private/claytron/dotfiles/trunk'


def push_dotfiles():
    """Push my dotfiles to a specific server
    """
    if not exists("$HOME"):
        abort("You do not appear to have a home directory")
    if exists(".dotfiles"):
        abort("The .dotfiles directory already exists")
    run('svn co %s .dotfiles' % env.dotfiles)
    run('.dotfiles/create_links.sh remove')
    run('.dotfiles/create_links.sh')


def remove_dotfiles(ignore=None):
    """Remove my dotfiles from a specific server
    """
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
