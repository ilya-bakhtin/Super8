import("..\1983_720_067.avs")
v096 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\v096.avi")
v096 = v096.convertToYV12
v096 = v096.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v096 = v096.convertToYV12
return v096.prefetch(6)

