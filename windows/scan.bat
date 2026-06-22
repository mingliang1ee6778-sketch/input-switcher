@echo off
cd /d "%~dp0"

set PATH_A=\\?\hid#vid_046d&pid_c548&mi_02&col01#8^&25563e2a^&0^&0000#{4d1e55b2-f16f-11cf-88cb-001111000030}
set PATH_B=\\?\hid#vid_046d&pid_c548&mi_02&col01#7^&2b242eea^&0^&0000#{4d1e55b2-f16f-11cf-88cb-001111000030}

echo === Receiver A (8^&25563e2a) ===
for %%d in (0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08) do (
    echo|set /p="dev=%%d : "
    .\hidapitester.exe --open-path "%PATH_A%" --length 7 --send-output 0x10,%%d,0x0A,0x1E,0x01,0x00,0x00 --read-input 500
)

echo.
echo === Receiver B (7^&2b242eea) ===
for %%d in (0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08) do (
    echo|set /p="dev=%%d : "
    .\hidapitester.exe --open-path "%PATH_B%" --length 7 --send-output 0x10,%%d,0x0A,0x1E,0x01,0x00,0x00 --read-input 500
)
pause
