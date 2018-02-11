import * as smartZip from "smart-zip";
import { removeSync } from "fs-extra";

/**
 * 
 * @param folder Folder to ZIP
 * @param remove should input folder be removed after zipping
 */
export async function zipFolder(folder: string, remove = false) {
    return new Promise((resolve, reject) => {
        smartZip.zip(folder, folder.concat('.zip'), false, function (error: string) {
            if (error) {
                reject(error);
            }

            if(remove) {
                removeSync(folder);
            }

            resolve(folder);
        })
    });
} 