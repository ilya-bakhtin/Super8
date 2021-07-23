import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v41 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\v41.avi")
v41 = v41.convertToYV12
v41 = v41.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v41 = v41.convertToYV12
return v41.prefetch(6)

