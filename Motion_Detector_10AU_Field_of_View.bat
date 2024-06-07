@echo off
title Motion Detector Control Panel
color 0A

:: Initial setup
set balance=1000
set detector_status=off
set fov=10
set Motion_status=idle
set motherboard=unknown

:main_menu
cls
echo ==================================================
echo             Motion Detector Control Panel
echo ==================================================
echo 1. Login
echo 2. Exit
echo ==================================================
set /p choice="Please choose an option (1-2): "

if "%choice%"=="1" goto login
if "%choice%"=="2" goto exit
echo Invalid choice. Please try again.
pause
goto main_menu

:login
cls
set /p user="Enter Username: "
set /p pass="Enter Password: "
echo Authenticating...
:: Simulating a database check for username and password
if "%user%"=="admin" if "%pass%"=="password" (
    echo Authentication successful!
    pause
    goto control_panel
) else (
    echo Invalid username or password. Please try again.
    pause
    goto main_menu
)

:control_panel
cls
echo ==================================================
echo             Motion Detector Control Panel
echo ==================================================
echo 1. Check Detector Status
echo 2. Activate/Deactivate Detector
echo 3. Check Motion Status
echo 4. Launch Motion
echo 5. Log Out
echo ==================================================
set /p cp_choice="Please choose an option (1-5): "

if "%cp_choice%"=="1" goto check_detector_status
if "%cp_choice%"=="2" goto toggle_detector
if "%cp_choice%"=="3" goto check_Motion_status
if "%cp_choice%"=="4" goto launch_Motion
if "%cp_choice%"=="5" goto main_menu
echo Invalid choice. Please try again.
pause
goto control_panel

:check_detector_status
cls
echo The motion detector is currently: %detector_status%
echo Field of View: %fov% AU
echo Motherboard: %motherboard%
pause
goto control_panel

:toggle_detector
cls
if "%detector_status%"=="off" (
    set detector_status=on
    echo The motion detector has been activated.
) else (
    set detector_status=off
    echo The motion detector has been deactivated.
)
pause
goto control_panel

:check_Motion_status
cls
echo The Motion is currently: %Motion_status%
pause
goto control_panel

:launch_Motion
cls
if "%Motion_status%"=="idle" (
    set Motion_status=launched
    echo The Motion has been launched.
) else (
    echo The Motion is already launched.
)
pause
goto control_panel

:exit
cls
echo Thank you for using the Motion Detector Control Panel. Goodbye!
pause
exit
