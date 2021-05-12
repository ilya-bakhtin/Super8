import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v175 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\v175.avi")
v175 = v175.convertToYV12
v175 = v175.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v175 = v175.convertToYV12
return v175.prefetch(6)

