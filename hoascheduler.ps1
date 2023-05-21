$action = New-ScheduledTaskAction - Execute 'powershell.exe -ExecutionPolicy Bypass --noprofile -Arguments "-File C:\Users\Public\hoa.ps1"'
$trigger = New-ScheduledTasktrigger -AtLogon
$task = New-ScheduledTask -Action $action -Trigger $trigger
Register-ScheduledTask Hoa -InputObject $task
