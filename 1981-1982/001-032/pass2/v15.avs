import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v15 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\v15.avi")
v15 = v15.convertToYV12
v15 = v15.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v15 = v15.convertToYV12
return v15.prefetch(6)

