const browserSync = require('browser-sync').create();
const gulp = require('gulp');
const sass = require('gulp-sass');

const paths = {
  markup: {
    src: './contrib/**/*.html',
  },
  styles: {
    src: [
      './contrib/**/*.scss',
      './core/**/*.scss',
    ],
    dest: './contrib/',
  }
};

function styles() {
  return gulp.src(paths.styles.src)
    .pipe(sass())
    .pipe(gulp.dest(paths.styles.dest));
};

function serve(done) {
  browserSync.init({
    open: false,
    server: './contrib/',
  });
  done();
}

function reload(done) {
  browserSync.reload();
  done();
}

function watch() {
  gulp.watch(paths.markup.src, reload);
  gulp.watch(paths.styles.src, gulp.series(styles, reload));
}

gulp.task('default', gulp.series(styles, serve, watch));
