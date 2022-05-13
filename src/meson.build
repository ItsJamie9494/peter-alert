sources = [
  'window.vala',
  'application.vala',
]

deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
]

conf = configuration_data()
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf.set_quoted('LOCALEDIR', join_paths(get_option('prefix'), get_option('localedir')))

config_file = configure_file(
    input: 'config.vala.in',
    output: 'config.vala',
    configuration: conf
)

gnome = import('gnome')

sources += gnome.compile_resources(
  'albania-resources',
  'albania.gresource.xml',
  c_name: 'as_resources'
)

executable(
  'albania',
  sources,
  config_file,
  vala_args: '--target-glib=2.50',
  dependencies: deps,
  install: true,
)
