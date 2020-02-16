project ('com.github.timecraft.js-test', 'vala', 'c', version: '0.1.0')

gnome = import ('gnome')
i18n = import ('i18n')

add_project_arguments (
    '-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name ()),
    language: 'c'
)

asresources = gnome.compile_resources (
    'as-resources',
    'data/' + meson.project_name () + '.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

dependencies = [
    dependency ('granite'),
    dependency ('gtk+-3.0'),
    dependency ('gtksourceview-3.0'),
    dependency ('glib-2.0'),
    dependency ('webkit2gtk-4.0')
]

subdir ('src')

executable (
    meson.project_name (),
    asresources,
    sources,
    dependencies: dependencies,
    install:true
)

subdir ('data')
subdir ('po')

meson.add_install_script ('meson/post_install.py')
