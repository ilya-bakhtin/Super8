import("..\1983_720_034.avs")
v035 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v035.avi")
v035 = v035.convertToYV12
v035 = v035.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v035 = v035.convertToYV12
return v035.prefetch(6)

