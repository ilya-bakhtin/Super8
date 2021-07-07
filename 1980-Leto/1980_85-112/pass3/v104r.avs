import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v104 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\pass2\v104f.avi").ConvertToYV24()
#v104 = v104.autolevels(ignore_low=0.003, ignore_high=0, border_t=200, filterRadius = 1, minRng=0)
v104 = v104.AdjustColor(ou=2, ov=-5, lo_th=0.1, hi_th=0.1, y = 50, h = -50, lock_chan=1, sat=1.2, red=0.98, grn=1, blu=0.96, gam_mac=true)
#v104 = v104.ColorYUV(gain_y=256).AdjustColor(2, -6, 0, 3, red_mul=0.98, blu_mul=0.96).\
v104 = v104.convertToYV12

v104 = v104.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)

v104 = v104.removeDirt
v104 = v104.autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1.5)
v104 = v104.UnsharpMask(strength=300, radius=3, threshold=1)
#return v104.histogram("levels").prefetch(12)
v104 = v104.adjustBorders
return v104.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
