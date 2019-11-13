# Define project name
project ('com.github.timecraft.js-test', 
    'vala', 'c',
    version: '0.1.0'
)



# GNOME and i18n
gnome = import ('gnome')
i18n = import ('i18n')


# Arguments
add_global_arguments ('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name ()), language:'c')

# C Compiler
cc = meson.get_compiler ('c')

asresources = gnome.compile_resources(
    'as-resources', 'data/gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

# Executable lives here
subdir ('src')


# Subdirectories with meson.build files
subdir ('data')
subdir ('po')

meson.add_install_script(join_paths('meson', 'post_install.py'))
