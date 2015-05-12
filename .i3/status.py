from i3pystatus import Status

# Solarized Colors
BASE03 = '#002b36'
BASE02 = '#073642'
BASE01 = '#586e75'
BASE00 = '#657b83'
BASE0 = '#839496'
BASE1 = '#93a1a1'
BASE2 = '#eee8d5'
BASE3 = '#fdf6e3'
YELLOW = '#b58900'
ORANGE = '#cb4b16'
RED = '#dc322f'
MAGENTA = '#d33682'
VIOLET = '#6c71c4'
BLUE = '#268bd2'
CYAN = '#2aa198'
GREEN = '#859900'

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 23:59
status.register(
    'clock',
    color=BASE0,
    format=' %a %-d %b %H:%M',
)

# Fake iStat Menus
# CPU
status.register(
    'cpu_usage_graph',
    interval=2,
    graph_style='braille-fill',
    graph_width=10,
    start_color=GREEN,
    end_color=RED,
)
# Memory
status.register(
    'mem',
    round_size=0,
    color=BASE0,
    warn_color=ORANGE,
    alert_color=RED,
    format=' Mem {percent_used_mem}% '
)

# Shows disk usage of /
status.register(
    'disk',
    path='/',
    color=BASE0,
    critical_color=RED,
    format=' Disk {percentage_used}% ',
)

status.run()
