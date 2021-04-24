import("11449 Bakhtin 02 N8.720p_04.mov.avs")
#v74 = v74.extractY.autolevels
v74_1 = v74.trim(0,20)
v74_2 = v74.trim(21,0)
v74_1 = v74_1.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
v74_2 = v74_2.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
v74 = v74_1 + v74_2
return v74.Prefetch(6)

