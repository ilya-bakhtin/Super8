import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
v229 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\v229.avi")
v229 = v229.convertToYV12
v229 = v229.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)
v229 = v229.convertToYV12
return v229.prefetch(6)

