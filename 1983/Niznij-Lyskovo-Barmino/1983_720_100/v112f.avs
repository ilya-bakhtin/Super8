import("1983_720_100.avs")
v112f = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v112.avi")
v112f = v112f.convertToYV12
v112f = v112f.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v112f = v112f.convertToYV12
return v112f.prefetch(6)

