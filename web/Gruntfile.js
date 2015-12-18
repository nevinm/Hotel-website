//module.exports = function (grunt) {
//    grunt.registerTask("demo", function () {
//        console.log("demo");
//    });
//};

module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            js: {
                files: [{
                        src: 'js/app/dev/*.js', // source files mask
                        dest: 'js/app/build/', // destination folder
                        expand: true, // allow dynamic building
                        flatten: true // remove all unnecessary nesting
                    }, {
                        src: 'views/admin/js/app/dev/*.js',
                        dest: 'views/admin/js/app/build/',
                        expand: true,
                        flatten: true
                    }]
            }
        },
        copy: {
            dev: {
                files: [{
                        expand: true,
                        cwd: 'js/app/dev/',
                        src: ['**'],
                        dest: 'js/app/build/'
                    }, {
                        expand: true,
                        cwd: 'css/dev/',
                        src: ['**'],
                        dest: 'css/build/'
                    }, {
                        expand: true,
                        cwd: 'views/admin/js/app/dev/',
                        src: ['**'],
                        dest: 'views/admin/js/app/build/'
                    }, {
                        expand: true,
                        cwd: 'views/admin/css/dev/',
                        src: ['**'],
                        dest: 'views/admin/css/build/'
                    }]
            },
            prd: {
                files: [{
                        expand: true,
                        cwd: 'css/dev/',
                        src: ['**'],
                        dest: 'css/build/'
                    }, {
                        expand: true,
                        cwd: 'views/admin/css/dev/',
                        src: ['**'],
                        dest: 'views/admin/css/build/'
                    }]
            }
        },
        clean: {
            js: {
                src: ["js/app/build/", "css/build/", "views/admin/css/build/", "views/admin/js/app/build/"]
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
                        cwd: 'css/dev/',
                        src: ['*.css', '!*.min.css'],
                        dest: 'css/build/'
                    }, {
                        expand: true,
                        cwd: 'views/admin/css/dev/',
                        src: ['*.css', '!*.min.css'],
                        dest: 'views/admin/css/build/'
                    }]
            }
        },
        watch: {
            js: {
                files: ['js/app/dev/*', 'views/admin/js/app/dev/*', 'css/dev/*', 'views/admin/css/dev/*'],
                tasks: ['dev']
            }
        },
        htmlmin: {
            options: {
                removeComments: true,
                collapseWhitespace: true
            },
            files: {
                expand: true,
                cwd: 'html/dev',
                src: ['*.html'],
                dest: 'html/'
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
    grunt.registerTask('dev', ['clean', 'copy:dev']);
    grunt.registerTask('build', ['clean', 'uglify:js', 'copy:prd', 'cssmin']);
    grunt.registerTask('default', 'htmlmin');
};