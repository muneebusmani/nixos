{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
    ];
    keyMode = "vi";
    baseIndex = 1;
    shortcut = "space";
    mouse = true;
    newSession = true;
    escapeTime = 10;
    customPaneNavigationAndResize = true;
    # terminal = "tmux-256color";
    # terminal = "xterm-kitty:RGB";
    extraConfig = ''
      # set-option -sa terminal-features "xterm-kitty:RGB"
      # set-option -g focus-events on
      # set -g mouse on
      # set-option -g history-limit 10000
      # set -g renumber-windows on
      # bind \` switch-client -t'{marked}'
      # bind-key "|" split-window -h -c "#{pane_current_path}"
      # bind-key "-" split-window -v -c "#{pane_current_path}"
      # bind-key "\\" split-window -fh -c "#{pane_current_path}"
      # bind-key "_" split-window -fv -c "#{pane_current_path}"
      # bind -r "<" swap-window -d -t -1
      # bind -r ">" swap-window -d -t +1
      # bind -n M-n new-window -c "#{pane_current_path}"
      # bind -n M-q killp
      # bind Space last-window
      # bind-key C-Space switch-client -l
      # set -g @yank_selection primary # or 'secondary' or 'clipboard'
      # set -g @continuum-restore 'on'
      # Basic
      # set -s default-terminal 'tmux-256color'
            set-option -a terminal-features 'alacritty:RGB'
      # set-option -sa terminal-features "tmux-256color,xterm-256color,xterm-kitty:RGB"
            set-option -sg escape-time 10
            set-option -g focus-events on
            set -g mouse on
            set-option -g history-limit 5000
            set -g base-index 1
            setw -g pane-base-index 1
            set -g renumber-windows on
            unbind C-a
            unbind C-b
            unbind C-Space
            set -g prefix C-Space
            bind C-Space send-prefix
            bind -n M-r source-file ~/.tmux.conf \; display "Reloaded!"
            bind \` switch-client -t'{marked}'
            bind-key "|" split-window -h -c "#{pane_current_path}"
            bind-key "-" split-window -v -c "#{pane_current_path}"
            bind-key "\\" split-window -fh -c "#{pane_current_path}"
            bind-key "_" split-window -fv -c "#{pane_current_path}"
            bind -n M-n new-window -c "#{pane_current_path}"
            bind -n M-q killp
            bind -n M-h previous-window
            bind -n M-l next-window
            bind -r "<" swap-window -d -t -1
            bind -r ">" swap-window -d -t +1
      # bind Space last-window
      # bind-key C-Space switch-client -l
      # Remap the keys for switching windows
      # set -g @plugin 'tmux-plugins/tmux-sensible'
      # set -g @plugin 'tmux-plugins/tpm'
      # set -g @plugin 'tmux-plugins/tmux-yank'
      # set -g @plugin 'christoomey/vim-tmux-navigator'
      # set -g @plugin 'catppuccin/tmux'
      # set -g @plugin 'tmux-plugins/tmux-resurrect'
      # set -g @plugin 'tmux-plugins/tmux-continuum'
      # set -g @plugin 'tmux-plugins/tmux-copycat'
      # set -g @plugin 'tmux-plugins/tmux-open'
      # set -g @plugin 'tmux-plugins/tmux-battery'
      # set -g @plugin 'wfxr/tmux-power'
      # set -g @plugin 'wfxr/tmux-net-speed'
      # set -g @plugin 'wfxr/tmux-web-reachable'
      # set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
      # set -g @plugin 'wfxr/tmux-fzf-url'
      # set -g @plugin 'erikw/tmux-powerline'
      # set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha
      # set -g @catppuccin_window_status_enable "yes"
      # set -g @catppuccin_window_status_icon_enable "yes"
      # set -g @catppuccin_status_default "yes"
      # set -g status-right '#{battery_status_bg} Batt: #{battery_icon} #{battery_percentage} #{battery_remain} | %a %h-%d %H:%M '
      # set -g @tmux_power_theme '#f2cdcd' # Catppuccin Flamingo
      # set -g @tmux_power_theme '#f38ba8' # Catppuccin Red
      # set -g @tmux_power_theme '#f5c2e7' # Catppuccin Red
      # set -g @tmux_power_date_format '%D'
      # set -g @tmux_power_time_format '%I:%M %p'
      # set -g @tmux_power_show_upload_speed true
      # set -g @tmux_power_show_download_speed true
      # set -g @tmux_power_prefix_highlight_pos 'LR'
      # set -g @tmux_power_show_web_reachable true
      # set -g @resurrect-strategy-nvim 'session'
      # set -g @resurrect-capture-pane-contents 'on'
      # set -g @continuum-restore 'on'
      # set -g @continuum-boot 'on'
      # set -g @yank_selection clipboard # or 'secondary' or 'primary'
      # set -g @open 'x'
      # set -g @open-editor 'C-x'
      # set -g @open-B 'https://www.bing.com/search?q='
      # set -g @open-S 'https://www.google.com/search?q='
      # set -g @fzf-url-bind 'x'
      # set -g @fzf-url-extra-filter 'grep -oE "\b[a-zA-Z]+\.txt\b"'
      # set -g @fzf-url-history-limit '2000'
      # set -g @fzf-url-open "microsoft-edge-stable"
      # set -g @tmux_power_show_upload_speed    true
      # set -g @tmux_power_show_download_speed  true
      # set -g @tmux_power_show_web_reachable   true
      # Vim Tmux Navigator
            is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
            | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
            bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
            bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
            bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
            bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
            tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
            if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
            "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
            if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
            "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
            bind-key -T copy-mode-vi 'C-h' select-pane -L
            bind-key -T copy-mode-vi 'C-j' select-pane -D
            bind-key -T copy-mode-vi 'C-k' select-pane -U
            bind-key -T copy-mode-vi 'C-l' select-pane -R
            bind-key -T copy-mode-vi 'C-\' select-pane -l
    '';
  };

}
