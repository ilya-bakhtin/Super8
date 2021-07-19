import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v11 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\v11.avi")
v11 = v11.convertToYV12
v11 = v11.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v11 = v11.convertToYV12
return v11.prefetch(6)

