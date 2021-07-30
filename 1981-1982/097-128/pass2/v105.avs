import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v105 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\v105.avi")
v105 = v105.convertToYV12
v105 = v105.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v105 = v105.convertToYV12
return v105.prefetch(6)

