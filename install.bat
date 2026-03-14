@echo off
chcp 65001 >nul
title Установщик RAM Cleaner
color 0A

echo ========================================
echo    УСТАНОВЩИК RAM CLEANER
echo ========================================
echo.

:: Проверяем права администратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Запустите файл от имени администратора!
    pause
    exit
)

:: Ищем файл EmptyStandbyList.exe
if exist "%~dp0EmptyStandbyList.exe" (
    echo Найден файл: EmptyStandbyList.exe
    echo Копирую в C:\Windows\System32...
    copy /Y "%~dp0EmptyStandbyList.exe" "C:\Windows\System32\EmptyStandbyList.exe" >nul
    
    if exist "C:\Windows\System32\EmptyStandbyList.exe" (
        echo ✅ Утилита успешно установлена!
    ) else (
        echo ❌ Ошибка при копировании!
    )
) else (
    echo ❌ Файл EmptyStandbyList.exe не найден!
    echo.
    echo Положите его в ту же папку, где лежит этот батник:
    echo %~dp0
)

echo.
pause