import("..\1983_720_067.avs")
v091 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\v091.avi")
v091 = v091.convertToYV12
v091 = v091.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v091 = v091.convertToYV12
return v091.prefetch(6)

