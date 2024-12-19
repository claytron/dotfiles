# send an sms for hilight events.
# (freely inspired by mailhilights.pl by me :)

use Irssi qw(print signal_add settings_add_str settings_add_bool
             settings_add_int settings_get_str settings_get_int
             parse_special command);
use vars qw($VERSION %IRSSI);
use POSIX qw(strftime);
use IPC::Open2;

$VERSION = "0.01";
%IRSSI = (
    authors => "Fernando \'Bucciarati\' Vezzosi",
    contact => "fvezzosi\@masobit.net",
    name    => "smshilights",
    description => "Send sms for hilights",
    license => "Public Domain"
);

my $last_sent_time=0;

sub send_sms {
  my $text = shift;

  open CMD, '| ' . settings_get_str('smshilights_command');
  print CMD $text;
  close CMD;
  print "Sent sms [$?]";
}

sub sig_printtext {
  my ($dest, $text, $stripped) = @_;
  my $thistime=time;
  my $ign_pattern=settings_get_str('smshilights_ignore_pattern');

  return unless
    (($dest->{level} & (MSGLEVEL_HILIGHT|MSGLEVEL_MSGS)) && # it is an hilight
     ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0 &&
     $dest->{server}->{usermode_away} == 1 );               # user is away

  return if # too little time passed? return!
    ($thistime - $last_sent_time < settings_get_int('smshilights_delay_min'));

  return if # we want to ignore this message
    (($ign_pattern ne '') and ($text =~ m/$ign_pattern/));

  $last_sent_time = $thistime;
  send_sms($stripped . "\n");
}

signal_add('print text', 'sig_printtext');
settings_add_int('smshilights', 'smshilights_delay_min', 0);
settings_add_str('smshilights', 'smshilights_ignore_pattern', "");
settings_add_str('smshilights', 'smshilights_command', "");

command("/set smshilights_");
