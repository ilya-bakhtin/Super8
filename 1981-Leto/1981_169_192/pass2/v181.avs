import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v181 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\v181.avi")
v181 = v181.convertToYV12
v181 = v181.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v181 = v181.convertToYV12
return v181.prefetch(6)

