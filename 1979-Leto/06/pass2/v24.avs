import("..\11449 Bakhtin 01 S8.720p_06.mov.avs")
v24 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1979-Leto\06\v24.avi")
v24 = v24.convertToYV12
v24 = v24.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v24 = v24.convertToYV12
return v24.prefetch(6)
