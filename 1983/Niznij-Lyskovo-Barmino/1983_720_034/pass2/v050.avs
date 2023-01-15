import("..\1983_720_034.avs")
v050 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v050.avi")
v050 = v050.convertToYV12
v050 = v050.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v050 = v050.convertToYV12
return v050.prefetch(6)

