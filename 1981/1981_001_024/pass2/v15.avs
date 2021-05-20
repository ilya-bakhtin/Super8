import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
v15 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\v15.avi")
v15 = v15.convertToYV12
v15 = v15.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v15 = v15.convertToYV12
return v15.prefetch(6)

