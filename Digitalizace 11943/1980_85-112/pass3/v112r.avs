import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v112 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\pass2\v112f.avi").ConvertToYV24()
v112 = v112.AdjustColor(ou=2, ov=-8, lo_th=0.1, hi_th=0.1, y = 10, h = -10, lock_chan=1, sat=1, red=0.86, grn=1, blu=0.86, gam_mac=true)

v112 = v112.convertToYV12

v112 = v112.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=1, sigma_c=0)

v112 = v112.removeDirt

v112 = v112.autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=2)
v112 = v112.UnsharpMask(strength=300, radius=3, threshold=1)

#return v112.histogram("levels").prefetch(12)
v112 = v112.adjustBorders
return v112.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
