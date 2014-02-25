:user_configuration

:: Path to Flex SDK
set FLEX_SDK=D:\40--Flex\_SDK_\flex_sdk_4.6.0.23201_AIR3.2

:: Path to Android SDK
set ANDROID_SDK=D:\Android_SDK\android-sdk-windows\tools
:: 


:validation
if not exist "%FLEX_SDK%" goto flexsdk
if not exist "%ANDROID_SDK%" goto androidsdk
goto succeed

:flexsdk
echo.
echo ERROR: incorrect path to Flex SDK in 'bat\SetupSDK.bat'
echo.
echo %FLEX_SDK%
echo.
if %PAUSE_ERRORS%==1 pause
exit

:androidsdk
echo.
echo ERROR: incorrect path to Android SDK in 'bat\SetupSDK.bat'
echo.
echo %ANDROID_SDK%
echo.
if %PAUSE_ERRORS%==1 pause
exit

:succeed
set PATH=%PATH%;%FLEX_SDK%\bin;%ANDROID_SDK%\platform-tools
adb devices
