import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v68 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v68.avi")
v68 = v68.convertToYV12
v68 = v68.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v68 = v68.convertToYV12
return v68.prefetch(6)

