import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v067 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\v067.avi")
v067 = v067.convertToYV12
v067 = v067.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=1, sigma_c=3, prefilter=2, hpad=16, vpad=16)
#v067 = v067.histogram("levels")
return v067.prefetch(12)
