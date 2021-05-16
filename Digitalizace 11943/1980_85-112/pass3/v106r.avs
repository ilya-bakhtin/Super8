import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v106 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\pass2\v106f.avi").ConvertToYV24()
#v106 = v106.autolevels(ignore_low=0.003, ignore_high=0, border_t=200, filterRadius = 1, minRng=0)
v106 = v106.AdjustColor(ou=2, ov=-5, lo_th=0.1, hi_th=0.1, y = 10, h = -50, lock_chan=1, sat=1.2, red=0.98, grn=1, blu=0.96, gam_mac=true)
#v106 = v106.ColorYUV(gain_y=256).AdjustColor(2, -6, 0, 3, red_mul=0.98, blu_mul=0.96).\
v106 = v106.convertToYV12

v106 = v106.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)

v106 = v106.removeDirt

v106 = v106.autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1.2)
v106 = v106.UnsharpMask(strength=300, radius=3, threshold=1)

#return v106.histogram("levels").prefetch(12)
v106 = v106.adjustBorders
return v106.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
