//module.exports = function (grunt) {
//    grunt.registerTask("demo", function () {
//        console.log("demo");
//    });
//};

module.exports = function (grunt) {
    grunt.registerTask("dev", function () {
        console.log("demo");
    });

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            files: {
                src: 'js/app/dev/*.js', // source files mask
                dest: 'js/app/release/', // destination folder
                expand: true, // allow dynamic building
                flatten: true // remove all unnecessary nesting
            }
        },
        copy: {
        },
        env: {
            dev: {
                NODE_ENV: 'DEVELOPMENT'
            },
            prod: {
                NODE_ENV: 'PRODUCTION'
            }
        },
        preprocess: {
            dev: {
                src: 'views/index-dev.html',
                dest: 'index.html'
            },
            prod: {
                src: './src/tmpl/index.html',
                dest: '../<%= pkg.version %>/<%= now %>/<%= ver %>/index.html',
                options: {
                    context: {
                        name: '<%= pkg.name %>',
                        version: '<%= pkg.version %>',
                        now: '<%= now %>',
                        ver: '<%= ver %>'
                    }

                }

            }

        }
//        watch: {
//            js: {files: 'js/*.js', tasks: ['uglify']}
//        }
    });

// load plugins
//    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-uglify');

// register at least this one task
    grunt.registerTask('default', ['uglify']);
    grunt.registerTask('dev', ['jshint', 'env:dev', 'clean:dev', 'preprocess:dev']);
    grunt.registerTask('prod', ['jshint', 'env:prod', 'clean:prod', 'uglify:prod', 'cssmin:prod', 'copy:prod', 'preprocess:prod']);

};