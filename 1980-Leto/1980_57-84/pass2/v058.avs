import("..\11943 Bakhtin N8 02.720p_03.mov.avs")

v058_ = LWLibavVideoSource("K:\1980\1980_57-84\11943 Bakhtin N8 02.720p_03-58.mov.avi")
v058_ = v058_.convertToYV12
v058_ = v058_.ColorYUV(gain_y=128)
#v058 = v058.trim(0,24) + v058.trim(24,-1) + v058.trim(26,27) + v058.trim(29,-1) + v058.trim(29,0)

v058 = v058_
v058 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\v058.avi")
v058 = v058.convertToYV12
f25 = (v058.trim(24,-1) + v058.trim(26, -1)).assumeFPS(12).AdjustFrameRate(preset_p="slow").assumeFPS(18).trim(1, -1)
f28 = (v058.trim(27,-1) + v058.trim(29, -1)).assumeFPS(12).AdjustFrameRate(preset_p="slow").assumeFPS(18).trim(1, -1)
v058 = v058.trim(0,24) + f25 + v058.trim(26,27) + f28 + v058.trim(29,0)
f26 = (v058.trim(25,-1) + v058.trim(27, -1)).assumeFPS(12).AdjustFrameRate(preset_p="slow").assumeFPS(18).trim(1, -1)
v058 = v058.trim(0,25) + f26 + v058.trim(27,0)

#return v058_.autolevels(filterRadius=0).interleave(v058)
#return v058

#v058_ = v058_.Filter_0
#v058_ = v058_.autolevels(filterRadius=0)

#v058 = v058.Filter_0
v058 = v058.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2, hpad=16, vpad=16)
#v058 = v058_.interleave(v058)
v058 = v058.convertToYV12
#v058 = v058.histogram("levels")
return v058.prefetch(6)
