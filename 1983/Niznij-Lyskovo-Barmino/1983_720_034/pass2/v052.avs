import("..\1983_720_034.avs")
v052 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v052.avi")
v052 = v052.convertToYV12
v052 = v052.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v052 = v052.convertToYV12
return v052.prefetch(6)

