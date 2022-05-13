sources = [
  'window.vala',
  'application.vala',
]

deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
]

gnome = import('gnome')

sources += gnome.compile_resources(
  'albania-resources',
  'albania.gresource.xml',
  c_name: 'as_resources'
)

executable(
  'albania',
  sources,
  vala_args: '--target-glib=2.50',
  dependencies: deps,
  install: true,
)
