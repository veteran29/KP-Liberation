export interface BuilderConfiguration {
    /** If disabled only errors will be logged */
    readonly verbose: boolean;
    /** 
     * If enablerd every preset will be processed concurently.
     * Can provide slight processing speed up at cost of messy console output.
     */
    readonly async: boolean;

    readonly zip: boolean;
    readonly pbo: boolean;
    /** Where build files will be outputted */
    readonly outputDir: string;
}

const DefaultConfiguration: BuilderConfiguration = {
    verbose: true,
    async: false,
    zip: false,
    pbo: false,
    outputDir: './output',
}

export default DefaultConfiguration;