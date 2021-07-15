import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
v220 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\v220.avi")
v220 = v220.convertToYV12
v220 = v220.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v220 = v220.convertToYV12
return v220.prefetch(6)

