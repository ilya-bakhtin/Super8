import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v88 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\v88.avi")
v88 = v88.convertToYV12
v88 = v88.Filter(th_SAD=750, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v88 = v88.convertToYV12
return v88.prefetch(6)

