@echo off
REM push_to_github.bat
REM Usage: push_to_github.bat <remote_repo_url>
REM Example: push_to_github.bat https://github.com/yourname/business-discovery-app.git

if "%1"=="" (
  echo Error: remote repository URL required.
  echo Usage: push_to_github.bat ^<remote_repo_url^>
  exit /b 1
)

set REMOTE_URL=%1










necho Done.git push -u origin main
necho Pushing to %REMOTE_URL% on branch main...
ngit branch -M main
ngit remote add origin %REMOTE_URL%git remote remove origin 2>nul || echo No existing origin to remove
nREM remove existing origin if presentncd /d "%~dp0"