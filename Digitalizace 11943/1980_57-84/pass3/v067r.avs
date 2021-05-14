import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v067 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\pass2\v067f.avi").ConvertToYV24()
v067 = v067.AdjustColor(ou=3, ov=-18, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=0.96, grn=1, blu=0.9, gam_mac=true)
v067 = v067.convertToYV12
v067_0 = v067.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=1, sigma_c=1)
v067_1 = v067.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=3, sigma_c=3)
offset = 45
v067 = v067_0.trim(0, offset) + v067_1.trim(offset+1, 0)
v067 = v067.removeDirt
v067 = v067.autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1.5)
v067 = v067.UnsharpMask(strength=300, radius=3, threshold=1)
#return v067.histogram("levels").prefetch(6)
v067 = v067.adjustBorders
return v067.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
