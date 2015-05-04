GruntVTEX = require 'grunt-vtex'

module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  defaultConfig = GruntVTEX.generateConfig grunt, pkg,
    livereload: !grunt.option('no-lr')
    relativePath: 'i18n'

  delete defaultConfig.watch

  # Add custom configuration here as needed
  customConfig =
    connect:
      http:
        options:
          base: 'build'
          open: false
          hostname: "*"
          port: process.env.PORT || 8081
          middleware: [
            (req, res, next) ->
              res.setHeader('Access-Control-Allow-Origin', '*')
              res.setHeader('Access-Control-Allow-Methods', '*')
              res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate')
              res.setHeader('Pragma', 'no-cache')
              res.setHeader('Expires', '0')
              next()
          ]

    watch:
      options:
        livereload: true
      gruntfile:
        files: ['Gruntfile.coffee']
      main:
        files: ['src/**/*.json']
        tasks: ['copy:main']

  tasks =
    # Building block tasks
    build: ['clean', 'copy:main', 'copy:pkg']
    min: ['useminPrepare', 'concat', 'uglify', 'cssmin', 'usemin'] # minifies files
    # Deploy tasks
    dist: ['build', 'copy:deploy'] # Dist - minifies files
    test: []
    vtex_deploy: ['shell:cp', 'shell:cp_br']
    # Development tasks
    default: ['build', 'connect:http', 'watch']
    devmin: ['build', 'min', 'connect:http:keepalive'] # Minifies files and serve

  # Project configuration.
  grunt.config.init defaultConfig
  grunt.config.merge customConfig
  grunt.loadNpmTasks name for name of pkg.devDependencies when name[0..5] is 'grunt-' and name isnt 'grunt-vtex'
  grunt.registerTask taskName, taskArray for taskName, taskArray of tasks
