@echo off
echo ========================================================
echo Starting Smart Internship Backend (Spring Boot : 8080)
echo ========================================================
cd /d "%~dp0backend"
mvn spring-boot:run
pause
