import("..\1983_720_034.avs")
v063 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v063.avi")
v063 = v063.convertToYV12
v063 = v063.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v063 = v063.convertToYV12
return v063.prefetch(6)

