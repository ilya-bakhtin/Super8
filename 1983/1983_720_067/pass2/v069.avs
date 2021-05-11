import("..\1983_720_067.avs")
v069 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\v069.avi")
v069 = v069.convertToYV12
v069 = v069.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v069 = v069.convertToYV12
return v069.prefetch(6)

