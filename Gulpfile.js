var bourbon    = require("bourbon").includePaths,
    autoprefix = require("gulp-autoprefixer"),
    connect    = require("gulp-connect"),
    gulp       = require("gulp"),
    sass       = require("gulp-sass");

var paths = {
  scss: [
    "./core/**/*.scss",
    "./contrib/styles.scss"]
};

gulp.task("sass", function () {
  return gulp.src(paths.scss)
    .pipe(sass())
    .pipe(autoprefix("last 2 versions"))
    .pipe(gulp.dest("./contrib"))
    .pipe(connect.reload());
});

gulp.task("connect", function() {
  connect.server({
    root: "contrib",
    port: 8000,
    livereload: true
  });
});

gulp.task("default", ["sass", "connect"], function() {
  gulp.watch(paths.scss, ["sass"]);
});
