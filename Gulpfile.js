const browserSync = require('browser-sync').create();
const gulp = require('gulp');
const sass = require('gulp-sass');

const paths = {
  scss: [
    './core/**/*.scss',
    './contrib/*.scss',
  ]
};

gulp.task('serve', ['sass'], function() {
  browserSync.init({
    open: false,
    server: './contrib',
  });

  gulp.watch(paths.scss, ['sass']);
  gulp.watch('contrib/*.html').on('change', browserSync.reload);
});

gulp.task('sass', function() {
  return gulp.src(paths.scss)
    .pipe(sass())
    .pipe(gulp.dest('./contrib'))
    .pipe(browserSync.stream());
});

gulp.task('default', ['serve']);
