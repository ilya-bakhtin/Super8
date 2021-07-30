import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v76 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v76.avi")
v76 = v76.convertToYV12
v76 = v76.Filter(th_SAD=500, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v76 = v76.convertToYV12
return v76.prefetch(6)

