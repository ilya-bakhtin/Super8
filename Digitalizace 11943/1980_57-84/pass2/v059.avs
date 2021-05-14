import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v059 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\v059.avi")
v059 = v059.convertToYV12
v059 = v059.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2, hpad=16, vpad=16)
#v059 = v059.histogram("levels")
return v059.prefetch(6)
