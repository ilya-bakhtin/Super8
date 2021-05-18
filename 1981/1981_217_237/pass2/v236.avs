import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
v236 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\v236.avi")
v236 = v236.convertToYV12
v236 = v236.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v236 = v236.convertToYV12
return v236.prefetch(6)

