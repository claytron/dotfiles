from pdb import DefaultConfig
try:
    HAS_PYGMENTS = True
    from pygments import token
except ImportError:
    HAS_PYGMENTS = False


class Config(DefaultConfig):

    """Config options for pdb++
    """
    # fancy prompt
    prompt = "oh no!> "
    # change the color to "inverse" so that all the colors show through
    current_line_color = 7
    # make sticky the default mode
    sticky_by_default = True
    bg = "light"
