import("1983_720_100.avs")
v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v125.avi")
v125 = v125.convertToYV12
v125 = v125.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v125 = v125.convertToYV12
return v125.prefetch(6)

