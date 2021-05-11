import("..\1983_720_034.avs")
v043 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v043.avi")
v043 = v043.convertToYV12
v043 = v043.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v043 = v043.convertToYV12
return v043.prefetch(6)

