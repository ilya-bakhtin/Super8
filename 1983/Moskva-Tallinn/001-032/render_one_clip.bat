cd delogo
call render-step.bat m:\media\video\super8\wrk\1983\Moskva-Tallinn v%1
cd ..\deshake
"C:\Program Files\VirtualDub\vdub64.exe" /s c:\Users\ilx\wrk\video\Super8\1983\Moskva-Tallinn\001-032\deshake\v%1.vdscript
call render-step.bat m:\media\video\super8\wrk\1983\Moskva-Tallinn v%1
cd ..\color
call render-step.bat m:\media\video\super8\wrk\1983\Moskva-Tallinn v%1
cd ..\sharp
call render-step.bat m:\media\video\super8\wrk\1983\Moskva-Tallinn v%1
cd ..
