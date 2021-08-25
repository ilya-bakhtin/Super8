Get-ChildItem '.\*.avs' -Recurse | ForEach {
(Get-Content $_ | ForEach { $_ -replace '11449 Bakhtin 02 N8.720p_04.mov.avs', '..\11943 Bakhtin N8 01.720p_01-161.mov.avs' }) |
Set-Content $_
}