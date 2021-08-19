import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v138 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v138.avi")
v138 = v138.convertToYV12
v138 = v138.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v138 = v138.convertToYV12
return v138.prefetch(6)

