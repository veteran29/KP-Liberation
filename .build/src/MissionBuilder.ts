import Fse = require('fs-extra');
import Path = require('path');

export interface Preset {
    readonly name: string;
    readonly map: string;
    readonly variables?: VariablesReplacements;
}

export interface FolderStructureInfo {
    /** Folder containing mission.sqf or part of path, "map" name from preset entry will be appended to this path. */
    readonly missionsFolder: string;
    /** Folder containg all other files with mission framework */
    readonly frameworkFolder: string;
    /** Name of file containg mission configurations, its contents will be replaced with values from preset "variables" entry. */
    readonly missionConfigFile: string;
    readonly workDir: string;
}

export interface VariablesReplacements {
    /** Key should be name of variable as set in SQF file, its value will be replaced with one from entry. */
    readonly [key: string]: any;
}

export default class MissionBuilder {

    static readonly missionSQM = 'mission.sqm';

    /**
     * Function used to log, empty Function by default
     */
    static log: (...args: any[]) => void = () => { };

    static warn: (...args: any[]) => void = MissionBuilder.log;

    private preset: Preset;

    private folderStructure: FolderStructureInfo;

    /**
     * 
     * @param preset 
     */
    constructor(preset: Preset, folderStructure: FolderStructureInfo) {
        this.preset = preset;
        this.folderStructure = folderStructure;
    }

    getMissionSqmPath(): string {
        return Path.resolve(
            this.folderStructure.missionsFolder.concat(this.preset.map)
        );
    }

    public getFrameworkPath(): string {
        return Path.resolve(this.folderStructure.frameworkFolder);
    }

    public getOutputDir(): string {
        return Path.resolve(
            this.folderStructure.workDir, [this.preset.name, this.preset.map].join('.')
        );
    }

    public getMissionConfigFilePath(): string {
        return Path.resolve(this.getOutputDir(), this.folderStructure.missionConfigFile);
    }

    /**
     * Builds mission
     * @returns Path to built mission directory
     */
    public async buildMission(): Promise<string> {
        await this.setupMissionDirectory();
        await this.setupFramework();

        this.replaceVariables();

        return this.getOutputDir();
    }

    private async setupMissionDirectory() {
        MissionBuilder.log('copying mission.sqm to: ', this.getOutputDir());
        return Fse.copy(
            this.getMissionSqmPath(),
            this.getOutputDir()
        );
    }

    private async setupFramework() {
        MissionBuilder.log('copying framework to: ', this.getOutputDir());
        return Fse.copy(
            this.getFrameworkPath(),
            this.getOutputDir()
        );
    }
    
    /**
     * Replaces variable values in configuration file
     */
    private replaceVariables() {
        if(this.preset.variables === undefined) {
            MissionBuilder.warn('no variables to replace');
            return;
        }

        MissionBuilder.log('reading mission configuration');
        let content = Fse.readFileSync(this.getMissionConfigFilePath(), 'utf8');

        // TODO optimize
        const variables = Object.getOwnPropertyNames(this.preset.variables);
        for (let variable of variables) {
            // https://regex101.com/r/YknC8r/1
            const regex = new RegExp(`(${variable} += +)(?:\\d+|".+")`, 'ig');

            let match = regex.exec(content);
            if(match !== null) {
                const value = JSON.stringify(this.preset.variables[variable]);

                MissionBuilder.log(`variable "${variable}" value replaced with: ${value}`);
                content = content.replace(regex, `$1${value}`);
            }
            else {
                MissionBuilder.warn(`no match for variable "${variable}", can't replace value!`);
            }
        }

        MissionBuilder.log('writing mission configuration');
        Fse.writeFileSync(this.getMissionConfigFilePath(), content, 'utf8');

    }

}
