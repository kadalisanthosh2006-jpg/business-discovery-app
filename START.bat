@echo off
REM Quick Start Script for Local Business Discovery App

echo.
echo ========================================
echo Local Business Discovery Web App
echo Quick Start Script
echo ========================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed!
    echo Please download and install Node.js from: https://nodejs.org/
    pause
    exit /b 1
)

echo ✓ Node.js is installed
echo.

REM Navigate to backend directory
cd backend

REM Install dependencies if node_modules doesn't exist
if not exist "node_modules" (
    echo Installing backend dependencies...
    call npm install
    echo.
)

REM Seed the database if it doesn't exist
if not exist "business.db" (
    echo.
    echo Seeding database with sample data...
    call node seed.js
    echo.
)

REM Start the server
echo.
echo ========================================
echo Starting Server...
echo ========================================
echo.
echo 🚀 Server running at: http://localhost:5000
echo 📱 Open this URL in your browser
echo.
echo Press Ctrl+C to stop the server
echo.

node server.js

pause
