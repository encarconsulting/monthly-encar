@echo off
chcp 65001 > nul
cd /d "%~dp0"
title 엔카 소식지 빌더 서버

echo.
echo ================================================
echo   엔카 소식지 빌더 - 서버 시작
echo ================================================
echo.

:: Python 설치 여부 확인
python --version > nul 2>&1
if errorlevel 1 (
    echo [오류] Python이 설치되어 있지 않습니다.
    echo.
    echo  설치 방법:
    echo  1. https://www.python.org 접속
    echo  2. Download Python 버튼 클릭 후 설치
    echo  3. 설치 화면에서 "Add Python to PATH" 반드시 체크!
    echo.
    pause
    exit /b 1
)

:: 소식지 HTML 파일 존재 확인
if not exist "%~dp0소식지_v4.html" (
    echo [오류] 소식지_v4.html 파일을 찾을 수 없습니다.
    echo 이 파일과 소식지_v4.html 이 같은 폴더에 있어야 합니다.
    echo.
    pause
    exit /b 1
)

echo  서버 주소 : http://localhost:8080/소식지_v4.html
echo  브라우저가 2초 후 자동으로 열립니다.
echo.
echo  ※ 이 창을 닫으면 서버가 종료됩니다.
echo ================================================
echo.

:: 2초 후 브라우저 자동 오픈 (별도 창)
start "" cmd /c "timeout /t 2 /nobreak > nul && start http://localhost:8080/소식지_v4.html"

:: 서버 실행 (이 창이 열려 있는 동안 유지)
python -m http.server 8080
