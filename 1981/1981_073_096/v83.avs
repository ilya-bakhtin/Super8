import("11449 Bakhtin 02 N8.720p_04.mov.avs")
#v83 = v83.Filter(th_SAD = 500, th_SADC=500)
v83 = v83.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
#v83 = v83.extractY.autolevels(border_l = 10, filterRadius = 0, minRng=0)
return v83.Prefetch(6)

