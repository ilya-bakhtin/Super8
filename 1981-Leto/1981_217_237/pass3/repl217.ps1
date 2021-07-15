Get-ChildItem '.\*.avs' -Recurse | ForEach {
(Get-Content $_ | ForEach { $_ -replace '11449 Bakhtin 02 N8.720p_04.mov.avs', '..\11449 Bakhtin 02 N8.720p_10.mov.avs' }) |
Set-Content $_
}