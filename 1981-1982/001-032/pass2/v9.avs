import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v9 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\v9.avi")
v9 = v9.convertToYV12
v9 = v9.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v9 = v9.convertToYV12
return v9.prefetch(6)

