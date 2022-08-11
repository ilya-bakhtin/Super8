SET dir=%1
SET dir_ds=%dir:\=\\%
"cmd.exe" /c ""D:\Program Files\MeGUI\tools\ffmpeg\ffmpeg.exe" -loglevel level+error -i "%2r.avs" -strict -1 -f yuv4mpegpipe - | "D:\Program Files\MeGUI\tools\x265\vs2019\x265.exe" --crf 12 --preset=fast --tune grain --sar 1:1 -o "%1\%2.265" --y4m -"
"D:\Program Files\MeGUI\tools\mp4box\mp4box.exe" -add "%1\%2.265#trackID=1:fps=18.0:par=1:1:name=" -tmp "%dir_ds%" -new "%1\%2rc.mp4"
del "%1\%2.265"
