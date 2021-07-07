import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v105 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\v105.avi")
v105 = v105.convertToYV12
#v105 = v105.AdjustColor(ou=3, ov=-6, lo_th=0.1, hi_th=0.1, x = 0, y = 0, w = 0, h=-50, lock_chan=1, sat=3, red=0.98, grn=1, blu=0.96, gam_mac=true)

v105_ = v105.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                    truemotion=false, sigma_y=3, sigma_c=0, prefilter=2, hpad=16, vpad=16)
v105 = v105.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=9, prefilter=2, hpad=16, vpad=16)
v105 = v105_.trim(0, 40) + v105.trim(41, 0)

#v105 = v105.AdjustColor(ou=2, ov=-5, lo_th=0.1, hi_th=0.1, x = 0, y = 0, w = 0, h=-50, lock_chan=1, sat=1, red=0.98, grn=1, blu=0.96, gam_mac=true)

#return v105.histogram("levels").prefetch(6)
return v105.prefetch(6)
