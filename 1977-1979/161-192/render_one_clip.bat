rem cd delogo
rem call render-step.bat n:\media\video\super8\wrk\1977-1979 v%1
cd deshake
rem "C:\Program Files\VirtualDub\vdub64.exe" /s c:\Users\ilx\wrk\video\Super8\1977-1979\161-192\deshake\v%1.vdscript
call render-step.bat n:\media\video\super8\wrk\1977-1979 v%1
cd ..\color
call render-step.bat n:\media\video\super8\wrk\1977-1979 v%1
cd ..\sharp
call render-step.bat n:\media\video\super8\wrk\1977-1979 v%1
cd ..
