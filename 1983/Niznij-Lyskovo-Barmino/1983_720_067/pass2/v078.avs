import("..\1983_720_067.avs")
v078 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\v078.avi")
v078 = v078.convertToYV12
v078 = v078.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v078 = v078.convertToYV12
return v078.prefetch(6)

