import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
v224 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\v224.avi")
v224 = v224.convertToYV12
v224 = v224.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v224 = v224.convertToYV12
return v224.prefetch(6)

