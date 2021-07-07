import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v111 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\v111.avi")
v111 = v111.convertToYV12

v111 = v111.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=9, prefilter=2, hpad=16, vpad=16)

#return v111.histogram("levels").prefetch(6)
return v111.prefetch(6)
