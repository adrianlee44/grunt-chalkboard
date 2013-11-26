# grunt-chalkboard [![Build Status](https://travis-ci.org/adrianlee44/grunt-chalkboard.png?branch=master)](https://travis-ci.org/adrianlee44/grunt-chalkboard)

> Grunt task for Chalkboard

## Getting Started
This plugin requires Grunt `~0.4.1`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-chalkboard --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-chalkboard');
```

## Chalkboard task

### Overview
In your project's Gruntfile, add a section named `chalkboard` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  chalkboard: {
    options: {
      // Task-specific options go here.
    },
    your_target: {
      // Target-specific file lists and/or options go here.
    },
  },
})
```

### Options

#### options.separator
Type: `String`
Default value: linefeed

Concatenated files will be joined on this string.

### Usage Examples

#### Basic option
```js
grunt.initConfig({
  chalkboard: {
    options: {},
    files: {
      'dest/output.md': ['src/file1.coffee', 'src/file2.coffee'],
    },
  },
})
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
- 2013-11-26   v0.2.1   Updated Chalkboard to v0.4.2
- 2013-06-03   v0.1.0   Initial working commit.
