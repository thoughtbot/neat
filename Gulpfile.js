var bourbon    = require("bourbon").includePaths,
    autoprefix = require("gulp-autoprefixer"),
    connect    = require("gulp-connect"),
    gulp       = require("gulp"),
    sass       = require("gulp-sass");

var paths = {
  scss: [
    "./app/assets/stylesheets/**/*.scss",
    "./contrib/styles.scss"]
};

gulp.task("sass", function () {
  return gulp.src(paths.scss)
    .pipe(sass({
      includePaths: ["styles"].concat(bourbon)
    }))
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
