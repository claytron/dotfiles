from pdb import DefaultConfig


class Config(DefaultConfig):
    """Config options for pdb++
    """
    # fancy prompt
    prompt = "oh no!> "
    # change the color to "inverse" so that all the colors show through
    current_line_color = 7
    # use macvim as the editor
    # TODO: test platform and mvim availability here
    editor = "mvim -f"
    # make sticky the default mode
    sticky_by_default = True
