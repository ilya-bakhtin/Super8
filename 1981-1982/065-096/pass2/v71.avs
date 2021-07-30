import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v71 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v71.avi")
v71 = v71.convertToYV12
v71 = v71.Filter(th_SAD=900, th_SADC=1700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v71 = v71.convertToYV12
return v71.prefetch(6)

