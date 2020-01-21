# Define executable
#   Name
#   sources
#   dependencies
#   install
executable (
    meson.project_name (),

    # Root files
    join_paths ('main.vala'),
    join_paths ('Constants.vala'),
    join_paths ('FileManager.vala'),
    join_paths ('Settings.vala'),


    # Views
    join_paths ('Views', 'SourceView.vala'),
    join_paths ('Views', 'WebView.vala'),
    
#   join_paths ('Views', 'JSConsole.vala'),

    # Widgets
    join_paths ('Widgets', 'Window.vala'),
    join_paths ('Widgets', 'HeaderBar.vala'),
    join_paths ('Widgets', 'CopyButton.vala'),
    join_paths ('Widgets', 'Overlay.vala'),
    join_paths ('Widgets', 'Toast.vala'),
    join_paths ('Widgets', 'SettingsButton.vala'),
    join_paths ('Widgets', 'SettingsMenu.vala'),

    # Dialogs
    join_paths ('Dialogs', 'Alert.vala'),
    
    # Resources
    as_resources,
    
    # Dependencies
    dependencies: [
        dependency ('granite'),
        dependency ('gtk+-3.0'),
        dependency ('gtksourceview-3.0'),
        dependency ('glib-2.0'),
        dependency ('webkit2gtk-4.0')
    ],
    
    

    install:true
)
