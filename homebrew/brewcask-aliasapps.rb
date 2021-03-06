# brew cask aliasapps
#
# Creates application aliases in ~/Applications/HomebrewCaskAliases to any
# Applications (.app) found symlinked from ~/Applications to
# /opt/homebrew-cask/Caskroom. Homebrew Cask automatically creates and deletes
# these symlinks as applications are installed and deleted, so they are a
# good indication of which applications are currently installed.
#
# Depends on:
# - https://github.com/Homebrew/homebrew/blob/master/Library/Formula/trash.rb
# - https://github.com/alphabetum/aliasapp/
#
# William Melody, 2014 - https://github.com/alphabetum/aliasapp/


require 'fileutils'
require 'pathname'

apps_directory = File.join(ENV['HOME'], 'Applications')
target_dir = File.join(ENV['HOME'], 'Applications', 'HomebrewCaskAliases')

if File.exist? target_dir
  system "trash", target_dir
end
# Homebrew Cask overrides FileUtils.mkdir, so calling system command directly.
system "mkdir", "-p", target_dir

# Get all filenames from the ~/Applications directory
files_in_apps = Dir["#{apps_directory}/*"]

files_in_apps.each do |file|
  if File.symlink?(file)
    FileUtils.mkdir(target_dir) unless File.exists?(target_dir)

    source = Pathname.new(file).realpath.to_s
    if source =~ %r{/opt/homebrew-cask/Caskroom}
      puts "Aliasing #{file}"
      app_name = File.basename(file)
      target = File.join(target_dir, app_name)

      system "alias-app", source, target
    end
  end
end

puts "Finished aliasing cask applications. Find the alias applications under #{target_dir}."
