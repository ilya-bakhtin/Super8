import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v51 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\v51.avi")
v51 = v51.convertToYV12
v51 = v51.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v51 = v51.convertToYV12
return v51.prefetch(6)

