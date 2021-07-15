import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v191 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\v191.avi")
v191 = v191.convertToYV12
v191 = v191.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v191 = v191.convertToYV12
return v191.prefetch(6)

