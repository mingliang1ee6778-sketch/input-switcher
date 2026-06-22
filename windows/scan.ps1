$pathA = "\\?\hid#vid_046d&pid_c548&mi_02&col01#8&25563e2a&0&0000#{4d1e55b2-f16f-11cf-88cb-001111000030}"
$pathB = "\\?\hid#vid_046d&pid_c548&mi_02&col01#7&2b242eea&0&0000#{4d1e55b2-f16f-11cf-88cb-001111000030}"

Write-Host "=== Receiver A ===" -ForegroundColor Cyan
foreach ($di in 1..8) {
    $hex = "0x{0:X2}" -f $di
    $result = & ".\hidapitester.exe" --open-path $pathA --length 7 --send-output "0x10,$hex,0x0A,0x1E,0x01,0x00,0x00" --read-input 500 2>&1
    $responded = ($result | Select-String "read [1-9]").Count -gt 0
    Write-Host "  dev=$hex : $(if ($responded) { 'RESPONDED' } else { '---' })"
}

Write-Host ""
Write-Host "=== Receiver B ===" -ForegroundColor Cyan
foreach ($di in 1..8) {
    $hex = "0x{0:X2}" -f $di
    $result = & ".\hidapitester.exe" --open-path $pathB --length 7 --send-output "0x10,$hex,0x0A,0x1E,0x01,0x00,0x00" --read-input 500 2>&1
    $responded = ($result | Select-String "read [1-9]").Count -gt 0
    Write-Host "  dev=$hex : $(if ($responded) { 'RESPONDED' } else { '---' })"
}
