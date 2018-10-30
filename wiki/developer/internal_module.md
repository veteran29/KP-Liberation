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

## 1. Overview

Internal modules are an foundation for the whole framework.
They provide core and optional gameplay features. 

## 2. Folder structure

Every module must reside in its own folder separate from the rest of the modules. The folder should be named in the convention `XX_name`, where `XX` indicates supposed load/dependency order. The name of the module must be be written in lowercase.

### 2.1. Module functions

Module functions must be configured in `functions.hpp` file.
This file must contain functions configuration for CfgFunctions.

Files with source of the functions must reside in `fnc` subfolder.

Every module must contain at least single function, `fn_name_preInit`, this function must be set to be executed at `preInit`. If module provides any global variables they must be defined in this function.

All `postInit` initialization must be placed into `fn_name_postInit` function. This function execution must be set to `postInit`.


### 2.2. Example module structure

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

## 3. Code style

### 3.1. Functions

#### Header

Every function must contain function [header](#example-function). The header must contain sensible description of the function, list of function parameters and the function return value.

#### Parameter list
List of function parameters must be in following format:
```
Parameter(s):
    _param1 - Description of first parameter [STRING, defaults to "some value"]
    _param2 - Description of second parameter [BOOLEAN, defaults to false]
```

If function does not use any parameters use following format:
```
Parameter(s):
    NONE
```

#### Parameter types

Following types are considered as correct for the parameter list variable types:
 - ARRAY
 - BOOLEAN
 - LOCATION
 - NUMBER
 - OBJECT
 - POSITION - can also have position type sufix like AGL, ATL etc.
 - STRING
 - GROUP

#### Execution

Functions must not use any execution suspending, it must be possible to execute any module function in unscheduled environment. If you think you need code suspension the code should be placed into `scripts` folder in the root of module folder and executed via `execVM`.

#### Return values

Every function must return a value, if function is expected to process something and not return any value then `true` should be returned as an indicator of successful execution.


#### Example function

```js
{% include_relative example_function.txt %}
```

### 3.2. General

#### Private variables

Every private variable must either use `private` keyword or be created by usage of `params` command.

```js
private _numbers = [1337, 101]; // Good
_numbers params ["_var", "_anotherOne"];
```

```js
_numbers = [1, 2]; // Bad
_var = _numbers select 0;
_anotherOne = _numbers select 1;
```

#### Global variables

Every global variable shall start with `KPLIB_example_` prefix where
`example` is name of the module in which created the variable was created.

There might be some exception from this rule for variables that are used in multiple modules, for like eg. `KPLIB_zeroPos".

#### Indentation

Every new `scope` shall be on new indentation level. Every indentation level equals 4 spaces.

Whitespace characters at end of the line are forbidden.

For optimal editing experience it is recommended to use an editor that supports [.editorconfig](https://editorconfig.org).

#### Common functions instead of commands

KP Liberation framework contains a set of "common" functions, these functions shall be prefered over built in commands whenever possible. 
