import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v19 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\v19.avi")
v19 = v19.convertToYV12
v19 = v19.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v19 = v19.convertToYV12
return v19.prefetch(6)

