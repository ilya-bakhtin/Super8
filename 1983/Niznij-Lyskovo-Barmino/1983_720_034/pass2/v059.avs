import("..\1983_720_034.avs")
v059 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v059.avi")
v059 = v059.convertToYV12
v059 = v059.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v059 = v059.convertToYV12
return v059.prefetch(6)

