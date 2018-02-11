# KP Liberation builder

## Description

This is an nodejs application written in TypeScript.   
It is main purpose is to automaticly build various versions of KP Liberation mission.

## Requirements

nodejs in version 7 or higher.

## Usage

```bash
# Install dependencies
npm install

# Run mission build
npm run build
```

## Configuration

### config.json

This file contains general application configuration

| Option    | Values    | Description  |
| --------- | --------- | ------------ |
| verbose   | `Boolean` | should build log be verbose |
| async     | `Boolean` | should every preset be build in pararrel |
| outputDir | `String`  | output directory, build files will be put here |

### presets.json

This file should contain an JSON array of `Presets`, for every preset one mission file will be built.

Every `Preset` entry should have following structure:
```json
{
    "name": "kp_liberation",
    "map": "Altis",
    "settings": {
        "blufor": 0,
        "opfor": 0,
        "resistance": 0,
        "civilian": 0
    }
}
```