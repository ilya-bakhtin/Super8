import("..\11449 Bakhtin 02 N8.720p_02.mov.avs")
v42 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_025_048\v42.avi")
v42 = v42.convertToYV12
v42 = v42.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v42 = v42.convertToYV12
return v42.prefetch(6)

