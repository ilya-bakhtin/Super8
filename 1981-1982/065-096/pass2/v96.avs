import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v96 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v96.avi")
v96 = v96.convertToYV12
v96 = v96.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=9, sigma_c=9, prefilter=2)
v96 = v96.convertToYV12
return v96.prefetch(6)

