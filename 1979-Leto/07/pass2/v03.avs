import("..\11449 Bakhtin 01 S8.720p_07.mov.avs")
v03 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1979-Leto\07\v03.avi")
v03 = v03.convertToYV12
v03 = v03.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v03 = v03.convertToYV12
return v03.prefetch(6)
