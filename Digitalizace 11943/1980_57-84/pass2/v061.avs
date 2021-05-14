import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v061 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\v061.avi")
v061 = v061.convertToYV12
v061 = v061.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2, hpad=16, vpad=16)
#v061 = v061.histogram("levels")
return v061.prefetch(6)
