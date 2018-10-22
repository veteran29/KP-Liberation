---
parent: wiki
# Category here must be the same as in index:
category: developer
# Metadata of the page:
title: Internal modules
layout: wiki
---

**This documentation is dedicated for people that want to contribute to mission framework.**
If you want to add customized features to mission please go to [external modules](external_module) documentation.

## Overview

Internal modules are an foundation for the whole framework.
They provide core and optional gameplay features. 

## Folder structure

Every module must reside in its own folder separate from the rest of the modules. The folder should be named in the convention `XX_name`, where `XX` indicates supposed load/dependency order. The name of the module must be be written in lowercase.

### Module functions

Module functions must be configured in `functions.hpp` file.
This file must contain functions configuration for CfgFunctions.

Files with source of the functions must reside in `fnc` subfolder.

Every module must contain at least single function, `fn_name_preInit`, this function must be set to be executed at `preInit`. If module provides any global variables they must be defined in this function.

All `postInit` initialization must be placed into `fn_name_postInit` function. This function execution must be set to `postInit`.


## Example module structure

Creation of internal module "example" dependant on module `03_respawn` would result in following folder structure:
```
Missionframework
└───modules
    ├───00_init
    ├───01_common
    ├───02_core
    ├───03_respawn
    └───04_example
        ├───fnc
        |   ├───fn_example_postInit.sqf
        |   └───fn_example_preInit.sqf
        ├───ui
        ├───functions.hpp
        ├───globals.sqf
        └───ui.hpp
```


```cpp
// functions.hpp
class example {
    file = "modules\04_example\fnc";

    // Module post initialization
    class example_postInitModule {
        postInit = 1;
    };

    // Module pre initialization
    class example_preInitModule {
        preInit = 1;
    };

};
```


```js
// fnc\fn_example_preInitModule.sqf
KPLIB_exampleSomeStuff = null;
KPLIB_exampleSomeArray = [];
```

```js
// fnc\fn_example_postInitModule.sqf
if (hasInterface) then {
    systemChat "Hello from example module!";
};
```
