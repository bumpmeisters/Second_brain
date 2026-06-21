@echo off
set LOG=%~dp0shopify-auth-url.txt
echo %* > "%LOG%"
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" %*
