Get-ChildItem '.\*.avs' -Recurse | ForEach {
(Get-Content $_ | ForEach { $_ -replace '11449 Bakhtin 02 N8.720p_04.mov.avs', '..\1983_720_133.avs' }) |
Set-Content $_
}