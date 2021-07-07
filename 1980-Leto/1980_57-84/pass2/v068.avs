import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v068 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\v068.avi")
v068 = v068.convertToYV12
w = v068.width
h = v068.height
v068 = v068.spline64Resize(480, 360)
v068 = v068.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=6, sigma_c=6, prefilter=2, hpad=16, vpad=16)
v068 = v068.spline64Resize(w, h)
#v068 = v068.histogram("levels")
return v068.prefetch(12)
