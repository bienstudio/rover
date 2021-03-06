const gulp = require('gulp');
const webpack = require('webpack-stream');
const sass = require('gulp-sass');
const livereload = require('gulp-livereload');
const eslint = require('gulp-eslint');

const webpackConfig = require('./webpack.config.js');

const paths = {
  jsc: ['./apps/web/assets/jsc/**/*'],
  css: ['./apps/web/assets/css/**/*.sass'],
  fonts: ['./apps/web/assets/fonts/**/*'],
  img: ['./apps/web/assets/img/*']
}

gulp.task('jsc', () => gulp.src(paths.jsc)
                           .pipe(webpack(webpackConfig))
                           .pipe(gulp.dest('./public/assets/jsc/'))
                           .pipe(livereload()));

gulp.task('css', () => {
  const options = {
    includePaths: [
      './apps/web/assets/css/lib',
    ],
    outputStyle: 'nested',
  };

  return gulp.src(paths.css)
             .pipe(sass(options).on('error', sass.logError))
             .pipe(gulp.dest('./public/assets/css/'))
             .pipe(livereload());
});

gulp.task('fonts', () => {
  return gulp.src(paths.fonts)
             .pipe(gulp.dest('./public/assets/fonts/'))
});

gulp.task('img', () => {
  return gulp.src(paths.img)
             .pipe(gulp.dest('./public/assets/img/'))
});

gulp.task('eslint', () => gulp.src(paths.jsc)
                               .pipe(eslint())
                               .pipe(eslint.format())
                               .pipe(eslint.failAfterError()));

gulp.task('watch', () => {
  livereload.listen();

  gulp.start('default');

  gulp.watch('./apps/web/assets/jsc/**/*', ['jsc']);
  gulp.watch('./apps/web/assets/css/**/*.sass', ['css', 'jsc']);
  gulp.watch('./apps/web/assets/fonts/**/*', ['fonts']);
  gulp.watch('./apps/web/assets/img/*', ['img']);
});

gulp.task('default', ['jsc', 'css', 'fonts', 'img']);
