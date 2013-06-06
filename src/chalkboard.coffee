#
# @chalk overview
# @name grunt-chalkboard
# @url https://github.com/adrianlee44/grunt-chalkboard
#
# @copyright Copyright (c) 2013 Adrian Lee
# @license Licensed under the MIT license.
#

module.exports = (grunt) ->

  grunt.registerMultiTask "chalkboard", "A simple grunt task to make documentation easier.", ->
    path       = require "path"
    chalkboard = require "chalkboard"

    options = @options
      separator: grunt.util.linefeed
      private:   false
      header:    false
      format:    "markdown"

    # Iterate over all specified file groups.
    @files.forEach (f) ->
      destPath = path.normalize f.dest

      # Read file source.
      src = f.src.filter((filepath) ->
        unless (exist = grunt.file.exists(filepath))
          grunt.log.warn "Source file \"" + filepath + "\" not found."
        return exist
      ).map((filepath) ->
        code = grunt.file.read filepath
        chalkboard.compile code, options, filepath
      ).join(grunt.util.normalizelf(options.separator))

      # Write the destination file.
      grunt.file.write destPath, src

      # Print a success message.
      grunt.log.writeln "File \"" + destPath + "\" created."
