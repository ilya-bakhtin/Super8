import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v193 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\v193.avi")
v193 = v193.convertToYV12
v193 = v193.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v193 = v193.convertToYV12
return v193.prefetch(6)

