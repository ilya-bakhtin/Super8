import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v94 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v94.avi")
v94 = v94.convertToYV12
v94 = v94.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v94 = v94.convertToYV12
return v94.prefetch(6)

