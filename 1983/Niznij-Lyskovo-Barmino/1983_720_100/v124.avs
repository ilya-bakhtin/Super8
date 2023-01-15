import("1983_720_100.avs")
v124 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v124.avi")
v124 = v124.convertToYV12
v124 = v124.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v124 = v124.convertToYV12
return v124.prefetch(6)

