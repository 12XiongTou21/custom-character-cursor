@echo off
chcp 65001 >nul
echo ========================================
echo   钻石剑 MC 光标安装程序
echo ========================================
echo.

set CURDIR=%~dp0
set TARGET=%LOCALAPPDATA%\Microsoft\Windows\Cursors\钻石剑

if not exist "%TARGET%" mkdir "%TARGET%"

echo 正在复制光标文件...
copy /Y "%CURDIR%*.cur" "%TARGET%\" >nul

echo 正在写入注册表...
reg add "HKCU\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /d "%TARGET%\arrow.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /d "%TARGET%\help.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /d "%TARGET%\appstarting.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /d "%TARGET%\wait.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /d "%TARGET%\crosshair.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /d "%TARGET%\ibeam.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /d "%TARGET%\nwpen.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /d "%TARGET%\no.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /d "%TARGET%\sizens.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /d "%TARGET%\sizewe.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /d "%TARGET%\sizenwse.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /d "%TARGET%\sizenesw.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /d "%TARGET%\sizeall.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /d "%TARGET%\uparrow.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Hand /t REG_EXPAND_SZ /d "%TARGET%\hand.cur" /f >nul

echo 正在刷新光标...
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo.
echo 安装完成！光标已切换为钻石剑 MC 风格。
echo 想恢复默认光标？运行 reset.bat
echo.
pause
