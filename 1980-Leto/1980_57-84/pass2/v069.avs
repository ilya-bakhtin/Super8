import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v069 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\v069.avi")
v069 = v069.convertToYV12
w = v069.width
h = v069.height
#v069 = v069.spline64Resize(480, 360)
v069_0 = v069.Filter(th_SAD=2000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=6, sigma_c=6, prefilter=2, hpad=16, vpad=16)
v069_1 = v069.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=1, sigma_c=3, prefilter=2, hpad=16, vpad=16)
o_0 = 29
o_1 = 120
v069 = v069_0.trim(0, o_0) + v069_1.trim(o_0 + 1, o_1) + v069_0.trim(o_1 + 1, 0)
#v069 = v069.spline64Resize(w, h)
#v069 = v069.histogram("levels")
return v069.prefetch(12)
