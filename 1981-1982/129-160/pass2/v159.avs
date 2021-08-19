import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v159 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\v159.avi")
v159 = v159.convertToYV12
v159 = v159.Filter(th_SAD=300, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0, prefilter=2, fft_sharp=1)
v159 = v159.convertToYV12
#v159 = v159.autolevels(minRng=0, gamma=2, filterRadius=0)
return v159.prefetch(6)

