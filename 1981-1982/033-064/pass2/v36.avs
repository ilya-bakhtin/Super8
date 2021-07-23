import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v36 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\v36.avi")
v36 = v36.convertToYV12
v36 = v36.Filter(th_SAD=700, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v36 = v36.convertToYV12
return v36.prefetch(6)

