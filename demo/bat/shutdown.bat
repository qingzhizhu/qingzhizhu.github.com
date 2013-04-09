@echo off
COLOR 79
cls

MODE con: COLS=50 LINES=20
:menu
::cls
echo.
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo             请选择要进行的操作，然后按回车
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo               1.启动倒计时
echo.
echo               2.取消倒计时
echo.
echo               3.退出

:cho
set /p choice=      请选择:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto s1
if /i "%choice%"=="2" goto s2
if /i "%choice%"=="3" goto end
echo 无效输入
echo.
goto cho
@echo off

:s1
::cls
shutdown -f -s -t 3600
goto menu

:s2
cls
shutdown /a 
goto menu

:end
exit