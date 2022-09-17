SET dir=%1
SET dir_ds=%dir:\=\\%
SET dir_f=%dir:m:\=f:\%
SET dir_f_ds=%dir_f:\=\\%

"cmd.exe" /c ""D:\Program Files\MeGUI\tools\ffmpeg\ffmpeg.exe" -loglevel level+error -i "%2.avs" -strict -1 -f yuv4mpegpipe - | "D:\Program Files\MeGUI\tools\x265\vs2019\x265.exe" --crf 12 --preset=slow --tune grain --sar 1:1 -o "%1\%2.265" --y4m -"

"D:\Program Files\MeGUI\tools\ffmpeg\ffmpeg.exe" -i "%2.avs" -y -acodec ac3 -ab 384k "%1\%2.ac3"

rem "D:\Program Files\MeGUI\tools\mp4box\mp4box.exe" -add "%1\%2.265#trackID=1:fps=18.0:par=1:1:name=" -tmp "%dir_f_ds%" -new "%1\%2f.mp4"
"D:\Program Files\MeGUI\tools\mp4box\mp4box.exe" -add "%1\%2.265#trackID=1:fps=18.0:par=1:1:name=" -add "%1\%2.ac3#trackID=1:name=" -tmp "%dir_f_ds%" -new "%1\%2f.mp4"

del "%1\%2.265"
del "%1\%2.ac3"
