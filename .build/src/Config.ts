export interface Preset {
    /** 
     * 
    */
    readonly sourceFolder: string;

    /** 
     * 
    */
    readonly missionName: string;

    /** 
     * 
    */
    readonly map: string;

    /** 
     * 
    */
    readonly variables?: VariablesReplacements;
}

export interface VariablesReplacements {
    /** Key should be name of variable as set in SQF file, its value will be replaced with one from entry. */
    readonly [key: string]: any;
}

export interface FolderStructureInfo {
    /** 
     * 
     */
    readonly missionsFolder: string;

    /** 
     * Path to folder with mission framework files.
     */
    readonly frameworkFolder: string;

    /** Name of file containg mission configurations.
     *  Values of variables will be replaced with values from preset "variables" entry. 
     */
    readonly missionConfigFile: string;

    /** 
     * Directory containing built missions 
     */
    readonly workDir: string;
}