import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v103 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\v103.avi")
v103 = v103.convertToYV12#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0)
v103 = v103.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=3, prefilter=2)
v103 = v103.convertToYV12#.histogram("levels")
return v103.prefetch(6)

