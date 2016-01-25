var gulp = require('gulp');
var gutil = require('gulp-util');
var bower = require('bower');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var rename = require('gulp-rename');
var sh = require('shelljs');

var paths = {
  sass: ['./assets/scss/**/*.scss'],
  materialDesignLite: './assets/lib/material-design-lite/',
  font_awesome: './assets/lib/font-awesome/'
};

gulp.task('default', ['sass', 'bundle']);

/**
 * Compilar sass
 */
gulp.task('sass', function(done) {
  gulp.src('./assets/scss/gdgguadalajara.scss')
    .pipe(sass())
    .pipe(gulp.dest('./www/css/'))
    .pipe(minifyCss({
      keepSpecialComments: 0
    }))
    .pipe(rename({ extname: '.min.css' }))
    .pipe(gulp.dest('./www/css/'))
    .on('end', done);
});

/**
 * Copy font-awesome
 */
gulp.task('font-awesome', function(done) {
  gulp.src([paths.font_awesome + 'fonts/**/*'])
      .pipe(gulp.dest('./www/fonts'))
      .on('end', done);
});

/**
 * Compilar un solo bonche de librerias
 */
gulp.task('bundle', function(done) {
  gulp.src([
    paths.materialDesignLite + "material.min.js"
  ])
  .pipe(concat('gdgguadalajara.bundle.js'))
  .pipe(gulp.dest('./www/js/'));
});

/**
 * Registrar tareas que pueden ser watchadas
 */
gulp.task('watch', function() {
  gulp.watch(paths.sass, ['sass']);
});

