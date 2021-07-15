import("11449 Bakhtin 02 N8.720p_04.mov.avs")
#v87 = v87.Filter(th_SAD = 500, th_SADC=500)
v87 = v87.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
#v87 = v87.extractY.autolevels(border_l = 10, filterRadius = 0, minRng=0)
return v87.Prefetch(6)

