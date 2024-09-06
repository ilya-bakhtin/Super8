cd delogo
#call render-step.bat %1 %2
cd ..\deshake
#"C:\Program Files\VirtualDub\vdub64.exe" /s c:\Users\ilx\wrk\video\Super8\1987\1987-svatba\deshake\%2.vdscript
#call render-step.bat %1 %2
cd ..\color
call render-step.bat %1 %2
cd ..\sharp
call render-step.bat %1 %2
cd ..
