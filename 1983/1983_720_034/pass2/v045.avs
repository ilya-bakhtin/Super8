import("..\1983_720_034.avs")
v045 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\v045.avi")
v045 = v045.convertToYV12
v045 = v045.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v045 = v045.convertToYV12
return v045.prefetch(6)

