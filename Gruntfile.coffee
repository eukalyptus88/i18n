GruntVTEX = require 'grunt-vtex'

module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  defaultConfig = GruntVTEX.generateConfig grunt, pkg,
    livereload: !grunt.option('no-lr')

  # Add custom configuration here as needed
  customConfig = {}

  tasks =
    # Building block tasks
    build: ['clean', 'jshint', 'copy:main', 'copy:pkg']
    min: ['useminPrepare', 'concat', 'uglify', 'cssmin', 'usemin'] # minifies files
    # Deploy tasks
    dist: ['build', 'copy:deploy'] # Dist - minifies files
    test: []
    vtex_deploy: ['shell:cp', 'shell:cp_br']
    # Development tasks
    default: ['build', 'connect', 'watch']
    devmin: ['build', 'min', 'connect:http:keepalive'] # Minifies files and serve

  # Project configuration.
  grunt.config.init defaultConfig
  grunt.config.merge customConfig
  grunt.loadNpmTasks name for name of pkg.devDependencies when name[0..5] is 'grunt-' and name isnt 'grunt-vtex'
  grunt.registerTask taskName, taskArray for taskName, taskArray of tasks
