const path = require('path');

const projectRoot = path.resolve('..');

module.exports = {
    debug: true,
    async: false,
    missionName: 'kp_liberation',
    projectRoot: projectRoot,
    buildDir: path.resolve(projectRoot, 'build'),
};