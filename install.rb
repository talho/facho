# Install hook code here
parent_lib_dir = File.join(Rails.root.to_s, "lib")
[ "workers" ].each { |lib_subdir|
  Dir.ensure_exists("#{Rails.root.to_s}/lib/#{lib_subdir}/plugin_#{lib_subdir}")
  rel_path = File.join(Rails.root.to_s,"vendor","plugins","facho","lib",lib_subdir)
  target = File.join(parent_lib_dir, lib_subdir, "plugin_#{lib_subdir}")
  Dir["#{rel_path}/*.rb"].each do |d|
    File.symlink(d, "#{target}/#{File.basename(d)}") unless File.symlink?("#{target}/#{File.basename(d)}")
  end
}

rel_path = File.join("..","..","..","..","spec","spec_helper.rb")
target = "#{Rails.root.to_s}/vendor/plugins/facho/spec/spec_helper.rb"
File.symlink(rel_path, target) unless File.symlink?(target)

# Create links in Rails.root.to_spublic so that the register_javascript_expansion()
# and register_stylesheet_expansion() methods can see the plugin's files.
parent_public_dir = File.join(Rails.root.to_s, "public")
[ "stylesheets" ].each { |public_subdir|
  rel_path = File.join("..","..","vendor","plugins","facho","public",public_subdir)
  target = File.join(parent_public_dir, public_subdir, "facho")
  File.symlink(rel_path, target) unless File.symlink?(target)
}
