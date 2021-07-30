import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v117 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\v117.avi")
v117 = v117.convertToYV12
v117 = v117.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v117 = v117.convertToYV12
return v117.prefetch(6)

