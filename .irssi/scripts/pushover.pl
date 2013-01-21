use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
use POSIX;

$VERSION = '1.00';
%IRSSI = (
    authors => 'David Lynch',
    contact => 'kemayo@gmail.com',
    name    => 'pushover',
    description => 'Sends highlights to Pushover',
    license => 'Public Domain',
    url     => 'http://github.com/kemayo/irssi-pushover/',
    changed => 'Sun Oct 12 10:25 PST 2012',
);

my $CMD = "pushover";

my $help = <<END;
Sends highlights to Pushover.net
Configure with:
/set pushover_user <user key from dashboard>
If you want to use your own application key:
/set pushover_app <app key you generate>
Send arbitrary message with:
/pushover send <message goes here>
END

my $user;
my $app;

Irssi::settings_add_str("pushover", "pushover_user", "");
Irssi::settings_add_str("pushover", "pushover_app", "gmLNYYShDHAMbdiRiUXNFdAyG0590n");

sub reload_settings {
    $user = Irssi::settings_get_str("pushover_user");
    $app = Irssi::settings_get_str("pushover_app");
}

sub sig_printtext {
    my ($dest, $text, $stripped) = @_;
    if (($dest->{level} & (MSGLEVEL_HILIGHT|MSGLEVEL_MSGS)) && ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0) {
        send_to_pushover($dest->{target} . ': ' . $stripped);
    }
}

sub send_to_pushover {
    if ($user eq "" or $app eq "") {
        # Irssi::print("Can't send to pushover: no user/app tokens", MSGLEVEL_CLIENTCRAP);
        return;
    }

    # posting blocks noticably, so we're going to create a disposable forked child to actually do it

    my $pid = fork();

    if (not defined $pid) {
        Irssi::print("Can't fork to send message. We are totally boned.", MSGLEVEL_CLIENTERROR);
        return;
    }
    if ($pid > 0) {
        # parent process
        return;
    }

    use LWP::UserAgent;
    LWP::UserAgent->new()->post("https://api.pushover.net/1/messages.json", [
        "token" => $app,
        "user" => $user,
        "message" => $_[0],
    ]);

    # now close the child process
    POSIX::_exit(1);
}

sub pushover_print_help {
    Irssi::print($help, MSGLEVEL_CLIENTCRAP);
}

sub pushover_help_hook {
    if ($_[0] eq $CMD) {
        pushover_print_help();
        Irssi::signal_stop;
    }
}

sub pushover_cmd_unknown {
    pushover_print_help();
    Irssi::signal_stop(); # avoid 'no such command' error.
}

sub pushover_cmd_handler {
    my ($data, $server, $item) = @_;
    $data =~ s/\s+$//g; # strip trailing whitespace.
    Irssi::command_runsub($CMD, $data, $server, $item);
}

sub pushover_cmd_send {
    my ($data, $server, $witem) = @_;

    if ($data eq "") {
        Irssi::print("Nothing to send", MSGLEVEL_CLIENTCRAP);
        return;
    }

    if ($user eq "" or $app eq "") {
        Irssi::print("Can't send to pushover: no user/app tokens", MSGLEVEL_CLIENTCRAP);
        return;
    }

    send_to_pushover($data);
}

Irssi::command_bind('help', \&pushover_help_hook);
Irssi::command_bind("$CMD send", \&pushover_cmd_send);
Irssi::command_bind($CMD, \&pushover_cmd_handler);
Irssi::signal_add_first("default command $CMD", \&pushover_cmd_unknown);

Irssi::signal_add('setup changed', \&reload_settings);
Irssi::signal_add('print text', \&sig_printtext);

reload_settings();
