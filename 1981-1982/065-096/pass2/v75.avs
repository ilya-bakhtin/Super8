import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v75 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v75.avi")
v75 = v75.convertToYV12
v75 = v75.Filter(th_SAD=1000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v75 = v75.convertToYV12
return v75.prefetch(6)

