import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v97 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\v97.avi")
v97 = v97.convertToYV12
v97_1 = v97.trim(0, 78)
v97_2 = v97.trim(79, 0)
v97_1 = v97_1.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=9, sigma_c=9, prefilter=2)
v97_2 = v97_2.Filter(th_SAD=2000, th_SADC=2000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=3, sigma_c=3, prefilter=2)
v97 = v97_1 + v97_2
v97 = v97.convertToYV12
return v97.prefetch(6)

