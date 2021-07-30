import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v112 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\v112.avi")
v112 = v112.convertToYV12
v112 = v112.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v112 = v112.convertToYV12
return v112.prefetch(6)

