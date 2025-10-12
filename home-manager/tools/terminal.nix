{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMonoNL Nerd Font";
      size = 18;
    };
    keybindings = {
      "alt+t" = "new_tab";
      "alt+w" = "close_tab";
      "alt+shift+t" = "new_os_window";
      "alt+f" = "toggle_fullscreen";
      "alt+W" = "close_window";
      "alt+}" = "next_tab";
      "alt+{" = "previous_tab";
      "alt+k" = "clear_terminal clear active";
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
    };
    themeFile = "rose-pine";
    settings = {
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{tab.last_focused_progress_percent}{tab.active_oldest_exe}";
      tab_bar_edge = "bottom";
      tab_bar_align = "left";
      hide_window_decorations = "yes";
      enabled_layouts  = "tall:bias=50;full_size=1;mirrored=false";

      # incative_tab_forground = "#222222";
      # foreground = "#e0def4";
      # background = "#191724";
      # selection_foreground = "#e0def4";
      # selection_background = "#403d52";
      # cursor = "#524f67";
      # cursor_text_color = "#e0def4";
      # url_color = "#c4a7e7";
      # active_tab_foreground = "#e0def4";
      # active_tab_background = "#26233a";
      # inactive_tab_foreground = "#6e6a86";
      # inactive_tab_background = "#191724";
      # active_border_color = "#ff0000";
      # inactive_border_color = "#403d52";

    };
  };
}
