import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v109 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\v109.avi")
v109 = v109.convertToYV12

v109 = v109.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=3, prefilter=2, hpad=16, vpad=16)

#return v109.histogram("levels").prefetch(6)
return v109.prefetch(6)
