#
# grunt-chalkboard
# https://github.com/adrianlee44/grunt-chalkboard
#
# Copyright (c) 2013 Adrian Lee
# Licensed under the MIT license.
#
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    coffeelint:
      all: ["Gruntfile.coffee", "tasks/*.coffee", "<%= nodeunit.tests %>"]


    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ["tmp"]


    # Configuration to be run (and then tested).
    chalkboard:
      fixture:
        files:
          "tmp/fixture.md": ["test/fixture.coffee"]

    coffee:
      src:
        files:
          "tasks/chalkboard.js": "src/chalkboard.coffee"


    # Unit tests.
    nodeunit:
      tests: ["test/*_test.coffee"]

    watch:
      src:
        files: "src/chalkboard.coffee"
        tasks: ["coffeelint", "coffee", "test"]

  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-nodeunit"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask "test", ["clean", "coffee", "chalkboard", "nodeunit"]

  # By default, lint and run all tests.
  grunt.registerTask "default", ["coffeelint", "test"]