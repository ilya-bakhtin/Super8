import("..\1983_720_034.avs")
v037 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v037.avi")
v037 = v037.convertToYV12
v037 = v037.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v037 = v037.convertToYV12
return v037.prefetch(6)

