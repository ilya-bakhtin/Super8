import("1983_720_100.avs")
v104f = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v104.avi")
v104f = v104f.convertToYV12
v104f = v104f.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v104f = v104f.convertToYV12
return v104f.prefetch(6)

