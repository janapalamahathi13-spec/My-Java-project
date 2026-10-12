@echo off
echo ==============================================
echo  NexusPay - Starting Spring Boot Backend
echo ==============================================
cd /d "%~dp0backend"
call .\mvnw.cmd spring-boot:run
pause
