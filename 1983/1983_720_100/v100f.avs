import("1983_720_100.avs")
v100f = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v100.avi")
v100f = v100f.convertToYV12
v100f = v100f.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v100f = v100f.convertToYV12
return v100f.prefetch(6)

