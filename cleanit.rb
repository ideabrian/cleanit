# CleanApp by Brian Ball
# Created March 24, 2015
# Updated March 25, 2105
#
# Take all loose files on desktop and toss them into a TODAY folder.

require 'FileUtils'

# Mac OS X Desktop path
desktop = File.expand_path('~/Desktop/')
Dir.chdir(desktop)

# output to terminal. make sure we're where we want to be
puts "#{Dir.pwd}"
puts desktop

# put all files into an array
d_files = Dir.entries(desktop)
# on a mac, remove the invisible files from the array
d_files.delete_if {|n| n[0] == '.'}
# show output while testing
puts d_files.inspect

# Where should we put the TODAY FOLDER?
target = "#{desktop}/TODAY"
today = FileUtils.mkdir('TODAY') if !File.directory?(target) 

# move the files into the TODAY folder
d_files.each do |file_to_be_moved|
	FileUtils.mv(file_to_be_moved, target)
end

# [x] Make it portable remove absolute paths.
# Make it work on Linux + Windows + OS X
# Create a manifest of the files - then email it to myself
# Back up the files to DropBox, Cloud, AWS, etc.
# (see how it could just go crazy?)