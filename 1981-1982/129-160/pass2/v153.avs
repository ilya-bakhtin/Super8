import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v153 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v153.avi")
v153 = v153.convertToYV12
v153 = v153.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v153 = v153.convertToYV12
return v153.prefetch(6)

