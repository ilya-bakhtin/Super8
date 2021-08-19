import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v133 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v133.avi")
v133 = v133.convertToYV12
v133 = v133.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v133 = v133.convertToYV12
return v133.prefetch(6)

