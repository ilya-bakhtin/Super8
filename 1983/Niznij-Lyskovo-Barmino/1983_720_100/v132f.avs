import("1983_720_100.avs")
v132f = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v132.avi")
v132f = v132f.convertToYV12
v132f = v132f.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v132f = v132f.convertToYV12
return v132f.prefetch(6)

