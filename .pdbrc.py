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
    if HAS_PYGMENTS:
        # Fix up the comment color for dark background
        colorscheme = {
            token.Token: ('', ''),
            token.Whitespace: ('lightgray', 'lightgray'),
            token.Comment: ('lightgray', 'lightgray'),
            token.Comment.Preproc: ('teal', 'turquoise'),
            token.Keyword: ('darkblue', 'blue'),
            token.Keyword.Type: ('teal', 'turquoise'),
            token.Operator.Word: ('purple', 'fuchsia'),
            token.Name.Builtin: ('teal', 'turquoise'),
            token.Name.Function: ('darkgreen', 'green'),
            token.Name.Namespace: ('_teal_', '_turquoise_'),
            token.Name.Class: ('_darkgreen_', '_green_'),
            token.Name.Exception: ('teal', 'turquoise'),
            token.Name.Decorator: ('darkgray', 'lightgray'),
            token.Name.Variable: ('darkred', 'red'),
            token.Name.Constant: ('darkred', 'red'),
            token.Name.Attribute: ('teal', 'turquoise'),
            token.Name.Tag: ('blue', 'blue'),
            token.String: ('brown', 'brown'),
            token.Number: ('darkblue', 'blue'),
            token.Generic.Deleted: ('red', 'red'),
            token.Generic.Inserted: ('darkgreen', 'green'),
            token.Generic.Heading: ('**', '**'),
            token.Generic.Subheading: ('*purple*', '*fuchsia*'),
            token.Generic.Error: ('red', 'red'),
            token.Error: ('_red_', '_red_'),
        }
