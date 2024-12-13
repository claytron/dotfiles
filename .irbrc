if defined? Reline::Face
  Reline::Face.config(:completion_dialog) do |conf|
    # Colors that work well for my catppuccin light and dark themed terminal
    conf.define(:default, foreground: '#7287fd', background: '#ccd0da')
    conf.define(:enhanced, foreground: '#dd7878', background: '#bcc0cc')
    conf.define(:scrollbar, foreground: '#ea76cb', background: '#7c7f93')
  end
end
