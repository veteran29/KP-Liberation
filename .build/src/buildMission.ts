// Src
import MissionBuilder, { Preset, FolderStructureInfo } from "./MissionBuilder";
import DefaultConfiguration, { BuilderConfiguration } from "./Config";
import { zipFolder } from "./zipFolder";
import { pboFolder } from "./pboFolder";
// Libs
import { mkdirsSync } from "fs-extra";
import { resolve } from "path";
import logger = require("console-chalk");

/**
 * 
 * @param presets Array of preset configurations
 * @param paths Object containg directory/file locations, by default searches for KP Liberation one folder above application location.
 * @param configuration Optional additional configurations
 */
export default function buildMission(presets: Preset[], paths?: FolderStructureInfo, configuration?: BuilderConfiguration) {

    function debug(...args: any[]): void {
        if (appConfig.verbose)
            logger.debug(...args);
    };

    const appConfig: BuilderConfiguration = { ...DefaultConfiguration, ...configuration };

    const defaultPathsInfo = {
        frameworkFolder: resolve('..', 'Missionframework'),
        missionsFolder: resolve('..', 'Missionbasefiles', 'kp_liberation.'),
        missionConfigFile: 'kp_liberation_config.sqf',
        workDir: resolve(appConfig.outputDir)
    };
    const pathsInfo: FolderStructureInfo = { ...defaultPathsInfo, ...paths };

    MissionBuilder.log = debug;
    MissionBuilder.warn = logger.warn;

    mkdirsSync(pathsInfo.workDir);

    console.time('build-time');

    (async () => {

        var promises: any[] = [];
        for (let preset of presets) {
            logger.log('Building:', preset.name, preset.map);
            console.time('time');

            const builder = new MissionBuilder(preset, pathsInfo);
            if (appConfig.async) {
                promises.push(
                    builder.buildMission()
                        .then(folder => zipFolder(folder))
                        .then(folder => logger.info(`zipped: ${folder}`))
                        .catch(error => logger.error(error))
                );
            }
            else {
                promises.push(
                    await builder.buildMission()
                        .then(folder => {
                            logger.info('finished:');
                            console.timeEnd('time');
                            logger.log();

                            return folder;
                        })
                        .then(async (folder) => {
                            await zipFolder(folder);
                            logger.info(`zipped: ${folder}\n`)

                            return folder;
                        })
                        .then(async (folder) => {
                            await pboFolder(folder);
                            logger.info(`pbo: ${folder}\n`)
                        })
                        .catch(error => logger.error(error))
                );
            }
        }

        Promise.all(promises)
            .then(() => {
                logger.log('\n-------------------------');
                logger.success('Build finished');
                console.timeEnd('build-time');
            })
            .catch(error => logger.error(error));
    })();

};