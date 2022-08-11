SET dir=%1
SET dir_ds=%dir:\=\\%
rem "cmd.exe" /c ""D:\Program Files\MeGUI\tools\ffmpeg\ffmpeg.exe" -loglevel level+error -i "%2.avs" -strict -1 -f yuv4mpegpipe - | "D:\Program Files\MeGUI\tools\x265\vs2019\x265.exe" --crf 12 --preset=fast --tune grain --sar 1:1 -o "%1\%2.265" --y4m -"
"D:\Program Files\MeGUI\tools\ffmpeg\ffmpeg.exe" -hwaccel qsv -i "%2.avs" -c:v hevc_qsv -preset veryslow -global_quality 6 -y "%1\%2.h265"
"D:\Program Files\MeGUI\tools\mp4box\mp4box.exe" -add "%1\%2.h265#trackID=1:fps=18.0:par=1:1:name=" -tmp "%dir_ds%" -new "%1\%2f-hw.mp4"
rem del "%1\%2.h265"
