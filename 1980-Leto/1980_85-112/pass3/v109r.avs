import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v109 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\pass2\v109f.avi").ConvertToYV24()
v109 = v109.AdjustColor(ou=2, ov=0, lo_th=0.1, hi_th=0.1, y = 10, h = -10, lock_chan=1, sat=1, red=0.9, grn=1, blu=0.96, gam_mac=true)

v109 = v109.convertToYV12

v109 = v109.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0)

#v109 = v109.removeDirt

v109 = v109.autolevels(ignore_low=0.03, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=2)
#v109 = v109.UnsharpMask(strength=300, radius=3, threshold=1)

#return v109.histogram("levels").prefetch(12)
v109 = v109.adjustBorders
return v109.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
