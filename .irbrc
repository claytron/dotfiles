if defined? Reline::Face
  Reline::Face.config(:completion_dialog) do |conf|
    # Colors that work well for my PaperColor light and dark themed terminal
    conf.define(:default, background: :gray)
    conf.define(:enhanced, foreground: :black, background: :bright_white)
    conf.define(:scrollbar, foreground: :blue, background: :gray)
  end
end
