# Send a mail for hilight events.
# (freely inspired by hilightwin.pl by Timo Sirainen)

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
    name    => "mailhilights",
    description => "Send mail for hilights",
    license => "Public Domain"
);

my $last_sent_time=0;

sub send_mail {
  my ($type, $text) = @_;

  open MAIL, "| " . settings_get_str('mailhilights_command');
  print MAIL 'From: ' . settings_get_str('mailhilights_from') . "\n";
  print MAIL 'To: ' . settings_get_str('mailhilights_to') . "\n";
  print MAIL 'Subject: ' . ( ($type eq 'QUERY') ?
      parse_special settings_get_str('mailhilights_subject_query') :
      parse_special settings_get_str('mailhilights_subject_chan') ) . "\n";
  print MAIL settings_get_str('mailhilights_custom_header') . "\n\n";
  if( settings_get_str('mailhilights_body_alter_command') ne '' ){
    my $pid = open2(\*CHILD_OUT, \*CHILD_IN, settings_get_str('mailhilights_body_alter_command'));
    print CHILD_IN $text;
    close CHILD_IN;
    while(<CHILD_OUT>){ print MAIL $_; }
    close CHILD_OUT;
    waitpid $pid, 0;
  }else{
    print MAIL $text;
  }
  close MAIL;
  print "Sent mail [$?]";
}

sub sig_printtext {
  my ($dest, $text, $stripped) = @_;
  my $thistime=time;
  my $ign_pattern=settings_get_str('mailhilights_ignore_pattern');

  return unless
    (($dest->{level} & (MSGLEVEL_HILIGHT|MSGLEVEL_MSGS)) && # it is an hilight
     ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0 &&
     $dest->{server}->{usermode_away} == 1 );               # user is away

  return if # too little time passed? return!
    ($thistime - $last_sent_time < settings_get_int('mailhilights_delay_min'));

  return if # we want to ignore this message
    (($ign_pattern ne '') and ($text =~ m/$ign_pattern/));

  $last_sent_time = $thistime;
  send_mail($dest->{window}->{active}->{type}, $stripped . "\n");
}

signal_add('print text', 'sig_printtext');
settings_add_str('mailhilights', 'mailhilights_to', "");
settings_add_str('mailhilights', 'mailhilights_from', "");
settings_add_str('mailhilights', 'mailhilights_custom_header', "");
settings_add_int('mailhilights', 'mailhilights_delay_min', 60 * 6);
settings_add_str('mailhilights', 'mailhilights_ignore_pattern', "");
settings_add_str('mailhilights', 'mailhilights_subject_chan',
                 "[mailhilights] \$; wants yuo on \$C");
settings_add_str('mailhilights', 'mailhilights_subject_query',
                 "[mailhilights] \$, wants yuo privately");
settings_add_str('mailhilights', 'mailhilights_body_alter_command', "");
settings_add_str('mailhilights', 'mailhilights_command',
                 "/usr/sbin/sendmail -oi -t");

command("/set mailhilights_");
