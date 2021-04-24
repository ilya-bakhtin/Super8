import("11449 Bakhtin 02 N8.720p_04.mov.avs")
#v79 = v79.Filter(th_SAD = 500, th_SADC=500)
v79 = v79.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
#v79 = v79.extractY.autolevels(border_l = 10, filterRadius = 0, minRng=0)
return v79.Prefetch(6)

