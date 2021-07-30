import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v121 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\v121.avi")
v121 = v121.convertToYV12
v121 = v121.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v121 = v121.convertToYV12
return v121.prefetch(6)

