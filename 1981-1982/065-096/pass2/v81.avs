import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v81 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v81.avi")
v81 = v81.convertToYV12
v81 = v81.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v81 = v81.convertToYV12
return v81.prefetch(6)

