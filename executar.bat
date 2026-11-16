@echo off
setlocal
cd /d "%~dp0"

where javac >nul 2>nul
if errorlevel 1 (
    echo [ERRO] Java JDK nao encontrado. Instale o JDK 21 ou superior:
    echo        https://adoptium.net/
    pause
    exit /b 1
)

if not exist bin mkdir bin

echo Compilando...
dir /s /b src\*.java > sources.txt
javac -encoding UTF-8 -d bin @sources.txt
set RESULT=%errorlevel%
del sources.txt
if not %RESULT%==0 (
    echo [ERRO] Falha na compilacao.
    pause
    exit /b 1
)

echo Iniciando o jogo...
start "" javaw -cp bin app.Main
endlocal
