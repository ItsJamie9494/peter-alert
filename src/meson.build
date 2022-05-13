albanianvirus_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
]

albanianvirus_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
]

gnome = import('gnome')

albanianvirus_sources += gnome.compile_resources('albanianvirus-resources',
  'albanianvirus.gresource.xml',
  c_name: 'albanianvirus'
)

executable('albanianvirus', albanianvirus_sources,
  vala_args: '--target-glib=2.50',  dependencies: albanianvirus_deps,
  install: true,
)
