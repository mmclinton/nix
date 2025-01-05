''
  # Window sizing when launching the application
  remember_window_size  no
  initial_window_width  120c
  initial_window_height 40c
  enable_true_color     yes

  # Cosmetic preferences 
  hide_window_decorations  yes
  tab_bar_style            powerline
  window_padding_width     8
  # wayland_titlebar_color system

  # Font
  font_size        13.0
  font_family      BerkeleyMono-Regular
  bold_font        BerkeleyMono-Bold
  italic_font      BerkeleyMono-Oblique
  bold_italic_font BerkeleyMono-Bold-Oblique

  # Performance
  input_delay        0
  repaint_delay      2
  sync_to_monitor    no
  wayland_enable_ime no

  # BEGIN_KITTY_THEME
  # OneDark-Pro
  include github-dark.conf
  # END_KITTY_THEME
''
