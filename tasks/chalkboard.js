(function() {
  module.exports = function(grunt) {
    return grunt.registerMultiTask("chalkboard", "A simple grunt task to make documentation easier.", function() {
      var chalkboard, options, path;

      path = require("path");
      chalkboard = require("chalkboard");
      options = this.options({
        separator: grunt.util.linefeed
      });
      return this.files.forEach(function(f) {
        var destPath, src;

        destPath = path.normalize(f.dest);
        src = f.src.filter(function(filepath) {
          var exist;

          if (!(exist = grunt.file.exists(filepath))) {
            grunt.log.warn("Source file \"" + filepath + "\" not found.");
          }
          return exist;
        }).map(function(filepath) {
          var code;

          code = grunt.file.read(filepath);
          return chalkboard.compile(code, {}, filepath);
        }).join(grunt.util.normalizelf(options.separator));
        grunt.file.write(destPath, src);
        return grunt.log.writeln("File \"" + destPath + "\" created.");
      });
    });
  };

}).call(this);
