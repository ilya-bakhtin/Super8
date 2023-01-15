import("..\1983_720_034.avs")
v054 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v054.avi")
v054 = v054.convertToYV12
v054 = v054.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v054 = v054.convertToYV12
return v054.prefetch(6)

