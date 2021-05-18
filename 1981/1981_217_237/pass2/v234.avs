import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
v234 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\v234.avi")
v234 = v234.convertToYV12
v234 = v234.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v234 = v234.convertToYV12
return v234.prefetch(6)

