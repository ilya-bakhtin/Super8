import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v142 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v142.avi")
v142 = v142.convertToYV12
v142 = v142.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v142 = v142.convertToYV12
return v142.prefetch(6)

