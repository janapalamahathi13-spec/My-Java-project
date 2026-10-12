@echo off
echo ========================================================
echo  NexusPay - Starting Full Stack Payroll System
echo ========================================================
echo Starting Backend (Spring Boot on http://localhost:8080)...
start "NexusPay Backend (Spring Boot)" cmd /k "cd /d %~dp0backend && .\mvnw.cmd spring-boot:run"

echo Starting Frontend (React on http://localhost:5173)...
start "NexusPay Frontend (Vite React)" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo Both servers are launching in separate windows!
echo Backend:  http://localhost:8080
echo Frontend: http://localhost:5173
echo H2 DB:    http://localhost:8080/h2-console
echo ========================================================
