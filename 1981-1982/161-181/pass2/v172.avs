import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v172 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\v172.avi")
v172 = v172.convertToYV12
v172 = v172.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=2, prefilter=2)
v172 = v172.convertToYV12
return v172.prefetch(6)

