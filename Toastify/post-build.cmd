@ECHO OFF

SetLocal EnableExtensions EnableDelayedExpansion

SET ConfigurationName=%~1
SET DevEnvDir=%~2
SET SolutionDir=%~3
SET TargetDir=%~4
SET TargetFileName=%~5

IF "%ConfigurationName:~0,7%"=="Windows" IF NOT "x%ConfigurationName:Release=%"=="x%ConfigurationName%" (
    :: It's a Windows Release configuration
    ECHO - CALL "%DevEnvDir%..\Tools\VsDevCmd.bat"
    CALL "%DevEnvDir%..\Tools\VsDevCmd.bat"

    ECHO - mt.exe -nologo -manifest "%TargetDir%%TargetFileName%.manifest" -outputresource:"%TargetDir%%TargetFileName%;#1"
    mt.exe -nologo -manifest "%TargetDir%%TargetFileName%.manifest" -outputresource:"%TargetDir%%TargetFileName%;#1"
    DEL "%TargetDir%%TargetFileName%.manifest"

    ECHO - Copy install script
    COPY /Y "%SolutionDir%InstallationScript\Install.nsi" "%TargetDir%Install.nsi"
    COPY /Y "%SolutionDir%InstallationScript\DotNetChecker.nsh" "%TargetDir%DotNetChecker.nsh"
)

EndLocal