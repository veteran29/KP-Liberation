@echo off

rem Check that https://nodejs.org/en/download/ exists before continuing
where /q node
if ERRORLEVEL 1 (
    echo node is missing. Ensure it is installed. It can be downloaded from:
    echo https://nodejs.org/en/download/
    timeout 30
    exit /b
)

rem Remove and recreate build folder
if exist build rd /s /q build >NUL
if not exist build mkdir build >NUL

rem CD into build tool directory
cd %~dp0.build

rem Install dependencies and build missions
call npm install --loglevel=error
call npm run build

echo.

pause
exit /b
