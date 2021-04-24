import("11449 Bakhtin 02 N8.720p_04.mov.avs")
#v80 = v80.Filter(th_SAD = 900, th_SADC=900)
v80 = v80.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
return v80.Prefetch(6)

