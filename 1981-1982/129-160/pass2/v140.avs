import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v140 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v140.avi")
v140 = v140.convertToYV12
v140 = v140.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v140 = v140.convertToYV12
return v140.prefetch(6)

