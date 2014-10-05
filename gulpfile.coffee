gulp = require 'gulp'
gutil = require 'gulp-util'
notify = require 'gulp-notify'
less = require 'gulp-less'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
concat = require 'gulp-concat'
minify = require 'gulp-minify-css'

lessDir = 'assets/less'
cssTarget = 'source/css'

gulp.task 'css', ->
  gulp.src lessDir + '/application.less'
    .pipe less()
    .pipe minify({keepBreaks:true})
    .on 'error', gutil.log
    .on 'error', notify.onError()
    .pipe rename 'style.css'
    .pipe gulp.dest cssTarget
    .pipe notify 'LESS compiled'

gulp.task 'watch', ->
    gulp.watch lessDir + '/**/*.less', ['css']

gulp.task 'default', ['css', 'watch']
