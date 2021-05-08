import("1983_720_100.avs")
v127 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v127.avi")
v127 = v127.convertToYV12
v127 = v127.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v127 = v127.convertToYV12
return v127.prefetch(6)

