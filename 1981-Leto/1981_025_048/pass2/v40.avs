import("..\11449 Bakhtin 02 N8.720p_02.mov.avs")
v40 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_025_048\v40.avi")
v40 = v40.convertToYV12
v40 = v40.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v40 = v40.convertToYV12
return v40.prefetch(6)

