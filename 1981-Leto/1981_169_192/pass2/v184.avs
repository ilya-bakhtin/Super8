import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v184 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\v184.avi")
v184 = v184.convertToYV12
v184 = v184.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v184 = v184.convertToYV12
return v184.prefetch(6)

