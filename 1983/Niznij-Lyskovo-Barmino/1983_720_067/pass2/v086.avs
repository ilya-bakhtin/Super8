import("..\1983_720_067.avs")
v086 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\v086.avi")
v086 = v086.convertToYV12
v086 = v086.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v086 = v086.convertToYV12
return v086.prefetch(6)

