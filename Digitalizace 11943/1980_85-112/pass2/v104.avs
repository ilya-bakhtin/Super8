import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v104 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\v104.avi")
v104 = v104.convertToYV12
#v104 = v104.AdjustColor(ou=3, ov=-6, lo_th=0.1, hi_th=0.1, x = 0, y = 0, w = 0, h=-50, lock_chan=1, sat=3, red=0.98, grn=1, blu=0.96, gam_mac=true)

#v104_ = v104.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
#                    truemotion=false, sigma_y=0, sigma_c=20, prefilter=2, hpad=16, vpad=16)
v104 = v104.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=9, prefilter=2, hpad=16, vpad=16)
#v104 = v104_.interleave(v104)

#v104 = v104.AdjustColor(ou=2, ov=-5, lo_th=0.1, hi_th=0.1, x = 0, y = 0, w = 0, h=-50, lock_chan=1, sat=1, red=0.98, grn=1, blu=0.96, gam_mac=true)

#return v104.histogram("levels").prefetch(6)
return v104.prefetch(6)
