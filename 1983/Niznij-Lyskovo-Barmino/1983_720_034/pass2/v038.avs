import("..\1983_720_034.avs")
v038 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v038.avi")
v038 = v038.convertToYV12
v038 = v038.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v038 = v038.convertToYV12
return v038.prefetch(6)

