import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
v218 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\v218.avi")
v218 = v218.convertToYV12
v218 = v218.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v218 = v218.convertToYV12
return v218.prefetch(6)

