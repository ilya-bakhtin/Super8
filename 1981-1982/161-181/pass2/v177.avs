import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v177 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\v177.avi")
v177 = v177.convertToYV12
v177 = v177.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v177 = v177.convertToYV12
return v177.prefetch(6)

