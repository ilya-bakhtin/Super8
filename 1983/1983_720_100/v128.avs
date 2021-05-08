import("1983_720_100.avs")
v128 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v128.avi")
v128 = v128.convertToYV12
v128 = v128.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v128 = v128.convertToYV12
return v128.prefetch(6)

