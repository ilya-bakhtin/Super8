import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v154 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v154.avi")
v154 = v154.convertToYV12
v154 = v154.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v154 = v154.convertToYV12
return v154.prefetch(6)

