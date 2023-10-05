if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g theme_title_display_user yes
    set -xg PYTHONDONTWRITEBYTECODE 1
    set -g theme_title_use_abbreviated_path yes
    set -g theme_display_hostname ssh
    set -g theme_title_display_process yes
    set -g theme_color_scheme gruvbox
    set -g theme_nerd_fonts yes
end
