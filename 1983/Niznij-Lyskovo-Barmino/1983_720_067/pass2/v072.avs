import("..\1983_720_067.avs")
v072 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\v072.avi")
v072 = v072.convertToYV12
v072 = v072.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=true, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2)
v072 = v072.convertToYV12
return v072.prefetch(6)

