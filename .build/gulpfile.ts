import * as gulp from "gulp";
import * as gulpReplace from "gulp-replace";
import * as gulpPbo from "gulp-armapbo";
import * as gulpZip from "gulp-zip";
import * as vinylPaths from "vinyl-paths";
import * as del from "del";

import { resolve } from "path";

import { MissionPaths } from "./src";
import { Preset, FolderStructureInfo } from "./src";


const presets: Preset[] = require('./_presets.json');

const paths: FolderStructureInfo = {
    frameworkFolder: resolve('..', 'Missionframework'),
    missionsFolder: resolve('..', 'Missionbasefiles'),
    missionConfigFile: 'kp_liberation_config.sqf',
    workDir: resolve("./build")
};


/**
 * Build gulp tasks
 */
let taskNames: string[] = [];
let taskNamesPbo: string[] = [];
let taskNamesZip: string[] = [];

for (let preset of presets) {
    const mission = new MissionPaths(preset, paths);
    const taskName = [preset.missionName, preset.map].join('.');

    /**
     * Copy mission framework to output dir
     */
    taskNames.push('framework_' + taskName);

    gulp.task('framework_' + taskName, () => {
        return gulp.src(mission.getFrameworkPath().concat('/**/*'))
            .pipe(gulp.dest(mission.getOutputDir()));
    });

    /**
     * Copy mission.sqm to output dir
     */
    taskNames.push('sqm_' + taskName);

    gulp.task('sqm_' + taskName, () => {
        return gulp.src(mission.getMissionSqmPath())
            .pipe(gulp.dest(mission.getOutputDir()));
    });

    /**
     * Replace variables values in configuration file
     */
    taskNames.push('vars_' + taskName);

    gulp.task('vars_' + taskName, () => {
        let src = gulp.src(mission.getMissionConfigFilePath());

        const variables = Object.getOwnPropertyNames(preset.variables);
        for (let variable of variables) {
            // https://regex101.com/r/YknC8r/1
            const regex = new RegExp(`(${variable} += +)(?:\\d+|".+")`, 'ig');
            const value = JSON.stringify(preset.variables[variable]);

            // replace variable value
            src = src.pipe(gulpReplace(regex, `$1${value}`));
        }

        return src.pipe(gulp.dest(mission.getOutputDir()));
    });

    /**
     * Pack PBOs
     */
    taskNamesPbo.push('pack_' + taskName);

    gulp.task('pack_' + taskName, () => {
        return gulp.src(mission.getOutputDir() + '/**/*')
            .pipe(gulpPbo({
                fileName: mission.getFullName() + '.pbo',
                progress: false,
                verbose: false,
                // Do not compress (SLOW)
                compress: true ? [] : [
                    '**/*.sqf',
                    'mission.sqm',
                    'description.ext'
                ]
            }))
            .pipe(gulp.dest(mission.getWorkDir() + '/PBO'));
    });

    /**
     * Pack PBOs
     */
    taskNamesZip.push('zip_' + taskName);

    gulp.task('zip_' + taskName, () => {
        const tempDir = mission.getWorkDir() + '/tmp/';

        // We need to build temporary folder to have correct paths in ZIP file
        return gulp.src([
            resolve('..', './userconfig/**/*'),
            resolve('..', 'LICENSE.md'),
            resolve('..', 'README.md')
        ], {
                base: resolve('..')
            })
            .pipe(
                gulp.src(
                    resolve(mission.getWorkDir(), 'pbo', mission.getFullName() + '.pbo'), {
                        base: resolve(mission.getWorkDir(), 'pbo')
                    })
            )
            .pipe(gulpZip(
                mission.getFullName() + '.zip'
            ))
            .pipe(gulp.dest(mission.getWorkDir()))
    });


}

gulp.task('clean', () => {
    return gulp.src(paths.workDir)
        .pipe(vinylPaths(del));
});

gulp.task('build', gulp.series(taskNames));

gulp.task('pbo', gulp.series(taskNamesPbo));

gulp.task('zip', gulp.series(taskNamesZip));

gulp.task('default',
    gulp.series(
        gulp.task('build'),
        gulp.task('pbo'),
        gulp.task('zip'),
    )
);
