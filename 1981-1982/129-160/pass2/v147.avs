import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v147 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v147.avi")
v147 = v147.convertToYV12
v147 = v147.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v147 = v147.convertToYV12
return v147.prefetch(6)

