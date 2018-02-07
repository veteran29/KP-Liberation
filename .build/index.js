const
    fse = require('fs-extra'),
    smartZip = require('smart-zip'),
    path = require('path'),
    config = require('./config'),
    buildConfig = require('./presets.json');


console.debug = config.debug ? console.log.bind(null, 'debug: ') : function () { };

const kpBuilder = {
    /**
     * 
     * @param {String} missionConfig 
     * @param {String} buildFolder 
     */
    async buildFolder(missionConfig, buildFolder) {
        const missionFolder = config.missionName.concat('.', missionConfig.map),
            missionsFolder = path.resolve(config.projectRoot, 'Missionbasefiles', missionFolder),
            frameworkFolder = path.resolve(config.projectRoot, 'Missionframework'),
            destFolder = path.resolve(config.buildDir, missionFolder)

        await this.copyMissionFile(missionsFolder, destFolder);
        await this.copyFrameworkToFolder(frameworkFolder, destFolder);
        await this.configure(destFolder, missionConfig.settings);

        return destFolder;
    },

    /**
     * 
     * @param {String} source 
     * @param {String} dest 
     */
    async copyMissionFile(source, dest) {
        console.debug('Copy mission to: ', dest);
        return fse.copy(
            path.resolve(source, 'mission.sqm'),
            path.resolve(dest, 'mission.sqm')
        );
    },

    /**
     * 
     * @param {String} source 
     * @param {String} dest 
     */
    async copyFrameworkToFolder(source, dest) {
        console.debug('Copy framework to: ', dest);
        return fse.copy(
            path.resolve(source),
            path.resolve(dest)
        );
    },

    /**
     * 
     * @param {String} folder 
     * @param {Object} settings 
     * @param {Number} settings.blufor
     * @param {Number} settings.opfor
     * @param {Number} settings.resistance
     * @param {Number} settings.civilian
     */
    async configure(folder, settings) {
        console.debug('Configure', folder);
        const filePath = path.resolve(folder, 'kp_liberation_config.sqf');
        /** @type {String} content */
        let content = fse.readFileSync(filePath, 'utf8');

        content = content.replace(/(KP_liberation_preset_blufor += +)(?:\d)/g, '$1'.concat(settings.blufor))
            .replace(/(KP_liberation_preset_opfor += +)(?:\d)/g, '$1'.concat(settings.opfor))
            .replace(/(KP_liberation_preset_resistance += +)(?:\d)/g, '$1'.concat(settings.resistance))
            .replace(/(KP_liberation_preset_civilians += +)(?:\d)/g, '$1'.concat(settings.civilian));

        return fse.writeFile(filePath, content);

    }
};

/**
 * 
 * @param {Object} missionConfig 
 */
async function buildMission(missionConfig) {
    return kpBuilder
            .buildFolder(missionConfig, config.buildDir);
};

/**
 * @param {String} folder 
 */
function zipFolder(folder) {
    smartZip.zip(folder, folder.concat('.zip'), false, function (error) {
        if (error) {
            throw error;
        }
        fse.removeSync(folder);
        console.log('Zipped mission: ', folder);
    });
}


console.log('Building kp_liberation');
console.debug('Project', config.projectRoot);
console.debug('Build', config.buildDir);



fse.mkdirs(config.buildDir).then(async () => {

    for (let missionConfig of buildConfig) {
        console.log('Building mission: ', missionConfig.map);
        if(config.async) {
            buildMission(missionConfig)
                .then(dir => zipFolder(dir))
                .catch(error => console.error(error));
        }
        else {
            await buildMission(missionConfig)
                .then(dir => zipFolder(dir))
                .then(() => console.log())
                .catch(error => console.error(error));
            console.log();
        }
    }

}).catch(error => console.error(error));;





