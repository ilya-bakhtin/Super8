import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v3 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\v3.avi")
v3 = v3.convertToYV12
v3 = v3.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v3 = v3.convertToYV12
return v3.prefetch(6)

