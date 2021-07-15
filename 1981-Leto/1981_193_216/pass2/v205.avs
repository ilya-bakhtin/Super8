import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v205 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\v205.avi")
v205 = v205.convertToYV12
v205 = v205.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v205 = v205.convertToYV12
return v205.prefetch(6)

