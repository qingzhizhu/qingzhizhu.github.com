@echo off
COLOR 79
cls

MODE con: COLS=50 LINES=20
:menu
::cls
echo.
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo             ��ѡ��Ҫ���еĲ�����Ȼ�󰴻س�
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo               1.��������ʱ
echo.
echo               2.ȡ������ʱ
echo.
echo               3.�˳�

:cho
set /p choice=      ��ѡ��:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto s1
if /i "%choice%"=="2" goto s2
if /i "%choice%"=="3" goto end
echo ��Ч����
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