import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v178 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\v178.avi")
v178 = v178.convertToYV12
v178 = v178.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v178 = v178.convertToYV12
return v178.prefetch(6)

