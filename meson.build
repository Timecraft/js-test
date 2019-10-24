# Define project name
project ('com.github.timecraft.jstest', 'vala', 'c')

# Arguments
add_global_arguments ('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name ()), language:'c')

# GNOME and i18n
gnome = import ('gnome')
i18n = import ('i18n')

# C Compiler
cc = meson.get_compiler ('c')

# Executable lives here
subdir ('src')

# Subdirectories with meson.build files
subdir ('data')
subdir ('po')

