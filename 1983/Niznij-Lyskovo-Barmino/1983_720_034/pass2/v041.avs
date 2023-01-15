import("..\1983_720_034.avs")
v041 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v041.avi")
v041 = v041.convertToYV12
v041 = v041.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v041 = v041.convertToYV12
return v041.prefetch(6)

