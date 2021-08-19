import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v155 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v155.avi")
v155 = v155.convertToYV12
v155_1 = v155.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=3, sigma_c=0, prefilter=2, fft_sharp=1)
v155_2 = v155.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=1, sigma_c=0, prefilter=2, fft_sharp=1)
v155 = v155_1.trim(0, 55) + v155_2.trim(56, 0)
v155 = v155.convertToYV12
return v155.prefetch(6)

