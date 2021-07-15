import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
v13 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\v13.avi")
v13 = v13.convertToYV12
v13 = v13.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v13 = v13.convertToYV12
return v13.prefetch(6)

