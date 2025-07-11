@echo off
REM ===========================================
REM Apache Maven Setup Script for Windows
REM Installs Maven and updates PATH permanently
REM Made by Kyssta
REM ===========================================

REM --- Set your desired Maven version here:
set MAVEN_VERSION=3.9.10

REM --- Where to install Maven:
set INSTALL_DIR=C:\maven

REM --- Temp download location:
set TEMP_DIR=%TEMP%\maven_download

echo.
echo ===========================================
echo Downloading Apache Maven %MAVEN_VERSION%...
echo ===========================================

REM --- Create temp dir
mkdir "%TEMP_DIR%"

REM --- Download Maven binary zip
powershell -Command "Invoke-WebRequest -Uri https://downloads.apache.org/maven/maven-3/%MAVEN_VERSION%/binaries/apache-maven-%MAVEN_VERSION%-bin.zip -OutFile %TEMP_DIR%\maven.zip"

echo.
echo ===========================================
echo Extracting Maven...
echo ===========================================

REM --- Make install dir
mkdir "%INSTALL_DIR%"

REM --- Extract zip
powershell -Command "Expand-Archive -Path %TEMP_DIR%\maven.zip -DestinationPath %INSTALL_DIR%"

REM --- Maven extracts to a folder like apache-maven-3.x.x
REM --- So set MAVEN_HOME to point to it
set MAVEN_HOME=%INSTALL_DIR%\apache-maven-%MAVEN_VERSION%

echo.
echo ===========================================
echo Maven extracted to %MAVEN_HOME%
echo ===========================================

REM === Add MAVEN_HOME system environment variable ===
echo Setting MAVEN_HOME system environment variable...
setx MAVEN_HOME "%MAVEN_HOME%" /M

REM === Add Maven bin to system PATH ===
echo Adding Maven bin directory to system PATH...

REM --- Get existing PATH
for /f "usebackq tokens=2*" %%A in (`reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul`) do set OldPath=%%B

REM --- Check if Maven bin is already in PATH
echo %OldPath% | find /I "%MAVEN_HOME%\bin" >nul
if %errorlevel%==0 (
    echo Maven bin directory is already in PATH.
) else (
    REM --- Add Maven bin to PATH
    setx Path "%OldPath%;%MAVEN_HOME%\bin" /M
    echo Added Maven bin directory to PATH.
)

echo.
echo ===========================================
echo DONE! Please open a NEW terminal and run: mvn -v
echo ===========================================

pause
