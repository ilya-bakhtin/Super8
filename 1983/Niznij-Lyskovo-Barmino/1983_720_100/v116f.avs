import("1983_720_100.avs")
v116f = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v116.avi")
v116f = v116f.convertToYV12
v116f = v116f.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v116f = v116f.convertToYV12
return v116f.prefetch(6)

