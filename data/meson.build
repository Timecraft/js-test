
# Install application icons.
icon_sizes = ['16','24','32', '48', '64','128']
foreach i : icon_sizes
  install_data (
  join_paths ('icons', meson.project_name () + '.' + i + '.svg'),
  install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor', i + 'x' + i, 'apps'),
  rename: meson.project_name () + '.svg'
  )
  install_data (
  join_paths ('icons', meson.project_name () + '.' + i + '.svg'),
  install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor', i + 'x' + i + '@2', 'apps'),
  rename: meson.project_name () + '.svg'
  )
endforeach


#Translate and install our .desktop file
i18n.merge_file(
    input: join_paths(meson.project_name() + '.desktop.in'),
    output: meson.project_name() + '.desktop',
    po_dir: join_paths(meson.source_root(), 'po'),
    type: 'desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'applications')
)


#Install .appdata.xml for AppCenter

i18n.merge_file(
    input: join_paths(meson.project_name() + '.appdata.xml.in'),
    output: meson.project_name() + '.appdata.xml',
    po_dir: join_paths(meson.source_root(), 'po'),
    install: true,
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)

install_data(
    'gschema.xml',
    install_dir: join_paths(get_option('datadir'), 'glib-2.0', 'schemas'),
    rename: meson.project_name() + '.gschema.xml'
)
