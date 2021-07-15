import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v170 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\v170.avi")
v170 = v170.convertToYV12
v170 = v170.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v170 = v170.convertToYV12
return v170.prefetch(6)

