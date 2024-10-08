SET dir=%1
SET dir_ds=%dir:\=\\%
SET dir_f=%dir:m:\=e:\%
SET dir_f=%dir_f:video\=video\tmp\%
SET dir_f_ds=%dir_f:\=\\%

    "cmd.exe" /c ""C:\Users\ilx\wrk\ffmpeg\ffmpeg.exe"             -loglevel level+error -i "%2.avs" -strict -1 -f yuv4mpegpipe - | "C:\Users\ilx\wrk\x265\x265.exe"                 --crf 12 --preset=slow --tune grain --sar 1:1 -o "%1\%2.h265" --y4m -"
rem "cmd.exe" /c ""D:\Program Files\MeGUI\tools\ffmpeg\ffmpeg.exe" -loglevel level+error -i "%2.avs" -strict -1 -f yuv4mpegpipe - | "D:\Program Files\MeGUI\tools\x265\x64\x265.exe" --crf 12 --preset=slow --tune grain --sar 1:1 -o "%1\%2.h265" --y4m -"
rem "C:\Users\ilx\wrk\ffmpeg\ffmpeg.exe" -hwaccel qsv -i "%2.avs" -c:v hevc_qsv -preset veryslow -global_quality 6 -y "%1\%2.h265"
rem "C:\Users\ilx\wrk\ffmpeg\ffmpeg.exe" -hwaccel dxva2 -i "%2.avs" -c:v hevc_amf -quality 0 -level 6 -rc 0 -qp_i 23 -qp_p 23 -y "%1\%2.h265"

    "C:\Users\ilx\wrk\ffmpeg\ffmpeg.exe"             -i "%2.avs" -y -acodec ac3 -ab 384k "%1\%2.ac3"
rem "D:\Program Files\MeGUI\tools\ffmpeg\ffmpeg.exe" -i "%2.avs" -y -acodec ac3 -ab 384k "%1\%2.ac3"

mkdir "%dir_f%"
rem "C:\Program Files\GPAC\mp4box.exe" -add "%1\%2.h265#trackID=1:fps=18.0:par=1:1:name=" -tmp "%dir_f_ds%" -new "%1\%2s.mp4"
    "C:\Program Files\GPAC\mp4box.exe"               -add "%1\%2.h265#trackID=1:fps=18.0:par=1:1:name=" -add "%1\%2.ac3#trackID=1:name=" -tmp "%dir_f_ds%" -new "%1\%2m.mp4"
rem "D:\Program Files\MeGUI\tools\mp4box\mp4box.exe" -add "%1\%2.h265#trackID=1:fps=18.0:par=1:1:name=" -add "%1\%2.ac3#trackID=1:name=" -tmp "%dir_f_ds%" -new "%1\%2m.mp4"
rmdir "%dir_f%"

del "%1\%2.h265"
del "%1\%2.ac3"
