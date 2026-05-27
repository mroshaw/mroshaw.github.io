# Launch browser in background after a short delay
Start-Job -ScriptBlock {
    Start-Sleep -Seconds 3
    Start-Process "http://localhost:8000/"
} | Out-Null

# Run Zensical in the foreground - Ctrl+C will stop it as normal
python -m zensical serve
