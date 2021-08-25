import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v166 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\v166.avi")
v166 = v166.convertToYV12
v166 = v166.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v166 = v166.convertToYV12
return v166.prefetch(6)

