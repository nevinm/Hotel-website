module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            js: {
                files: [{
                        src: 'app/js/app/*.js', // source files mask
                        dest: 'js/app/', // destination folder
                        expand: true, // allow dynamic building
                        flatten: true // remove all unnecessary nesting
                    }, {
                        src: 'views/admin/js/app/*.js',
                        dest: 'views/admin/js/app/',
                        expand: true,
                        flatten: true
                    }]
            }
        },
        copy: {
            files: {
                expand: true,
                cwd: 'app/',
                src: ['**'],
                dest: ''
            }
        },
        clean: {
            js: {
                src: ["index.html","js/", "css/", "views/", "images/", "fonts/"]
            }
        },
        cssmin: {
            options: {
                shorthandCompacting: false,
                roundingPrecision: -1,
                restructure: false
            },
            target: {
                files: [{
                        expand: true,
                        cwd: 'app/css/',
                        src: ['*.css', '!*.min.css'],
                        dest: 'css/'
                    }, {
                        expand: true,
                        cwd: 'app/views/admin/css/',
                        src: ['*.css', '!*.min.css'],
                        dest: 'views/admin/css/'
                    }]
            }
        },
        watch: {
            js: {
                files: ['app/*'],
                tasks: ['dev']
            }
        },
        htmlmin: {
            views: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: [{
                        expand: true,
                        cwd: 'app/views/',
                        src: ['*.html'],
                        dest: 'views/'
                    }, {
                        expand: true,
                        cwd: 'app/',
                        src: ['index.html'],
                        dest: ''
                    }, {
                        expand: true,
                        cwd: 'app/views/admin/',
                        src: ['*.html'],
                        dest: 'views/admin/'
                    }]
            }
        }
    });

// load plugins
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');

// register at least this one task
    grunt.registerTask('clear', ['clean']);
    grunt.registerTask('dev', ['clean', 'copy']);
    grunt.registerTask('build', ['clean', 'copy', 'uglify:js', 'cssmin', 'htmlmin:views']);
    grunt.registerTask('default', 'watch:js');
};
