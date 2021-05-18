import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v211 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\v211.avi")
v211 = v211.convertToYV12
v211 = v211.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v211 = v211.convertToYV12
return v211.prefetch(6)

