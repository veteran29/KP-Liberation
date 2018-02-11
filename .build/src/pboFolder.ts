import { resolve as resolvePath } from 'path';
import * as gulp from "gulp";
import * as gulpPbo from "gulp-armapbo";
/**
 * 
 * @param folder Folder to PBO
 * @param compress should pbo be compressed
 */
export async function pboFolder(folder: string, compress = true) {
    return new Promise((resolve, reject) => {
        gulp.task('pack', () => {
            return gulp.src(folder.concat('/**/*'))
                .pipe(gulpPbo({
                    verbose: true,
                    progress: true,
                    fileName: folder.concat('.pbo'),
                    compress: compress ? [
                        '**/*.sqf',
                        'mission.sqm',
                        'description.ext'
                    ] : []
                }))
                .pipe(gulp.dest(resolvePath(folder, '..')))
                .on('error', reject)
                .on('end', () => resolve(folder));
        });

        gulp.start('pack');
    });
} 