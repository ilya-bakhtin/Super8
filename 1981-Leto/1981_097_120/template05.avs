import("11449 Bakhtin 02 N8.720p_05.mov.avs")
#$$$clip$$$ = $$$clip$$$.Filter(th_SAD=$$$sad$$$, th_SADC=$$$sadc$$$, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
return $$$clip$$$.Prefetch(6)
