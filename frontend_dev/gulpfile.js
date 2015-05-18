//This is a test

var gulp = require('gulp'),
	del = require('del'),
	uglify = require('gulp-uglify'),
	sass = require('gulp-sass'),
	sourcemaps = require('gulp-sourcemaps'),
	prefix = require('gulp-autoprefixer'),
	rename = require('gulp-rename'),
	concat = require('gulp-concat'),
	notify = require('gulp-notify'),
	minifycss = require('gulp-minify-css');

// Sets the root folder of the output directory. Variable is use in the 'Scripts' and 'Styles' tasks.
var outputDir = 'dist';

// Scripts Task
// Uglifies (Explain this and link)
gulp.task('scripts', function() {
	return gulp.src('js/main/*.js')
		.pipe(concat('all.js'))
		.pipe(gulp.dest(outputDir + '/js'))
		.pipe(rename({suffix: '.min'}))
		.pipe(uglify())
		.pipe(gulp.dest(outputDir + '/js'))
		.pipe(notify({message: 'Scripts task complete'}));
});

// Styles Task
gulp.task('styles', function() {
	return gulp.src('sass/**/*.scss')
		.pipe(sass({
			errLogToConsole: true
		}))
		.pipe(prefix('last 2 versions'))
		.pipe(gulp.dest(outputDir + '/css'))
		.pipe(notify({message: 'Styles task complete'}))
		// minify css
		.pipe(rename({suffix:'.min'}))
		.pipe(minifycss())
		.pipe(gulp.dest(outputDir + '/css'));
});

// Clean Task
// Deletes the builds folder before recompiling.
gulp.task('clean', function(cb) {
	del(['dist'], cb);
});

// Watch Task
gulp.task('watch', function() {
	gulp.watch('js/main/*.js', ['scripts']);
	gulp.watch('sass/**/*.scss', ['styles']);
});

// Default Gulp Task
// Cleans the build directory before running through tasks in gulp.start.
gulp.task('default', ['clean'], function() {
	gulp.start('scripts', 'styles', 'watch');
});