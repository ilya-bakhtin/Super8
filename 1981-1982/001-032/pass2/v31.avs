import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v31 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\v31.avi")
v31 = v31.convertToYV12
v31 = v31.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v31 = v31.convertToYV12
return v31.prefetch(6)

