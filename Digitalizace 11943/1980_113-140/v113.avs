import("11943 Bakhtin N8 02.720p_05.mov.avs")
v113 = v113.Filter(th_SAD=500, th_SADC=1100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
#v113 = v113.Filter_0
#v113 = v113.extractY.autolevels(border_l = 10, filterRadius = 0, minRng=0)
return v113.Prefetch(6)

