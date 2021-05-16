import("..\11943 Bakhtin N8 02.720p_04.mov.avs")
v107 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\pass2\v107f.avi").ConvertToYV24()
#v107 = v107.autolevels(ignore_low=0.003, ignore_high=0, border_t=200, filterRadius = 1, minRng=0)
v107 = v107.AdjustColor(ou=2, ov=0, lo_th=0.1, hi_th=0.1, y = 10, h = -50, lock_chan=1, sat=1.2, red=0.96, grn=1, blu=0.96, gam_mac=true)

v107 = v107.convertToYV12

v107 = v107.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=1, sigma_c=0)

v107 = v107.removeDirt

v107 = v107.autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1.8)
v107 = v107.UnsharpMask(strength=300, radius=3, threshold=1)

#return v107.histogram("levels").prefetch(12)
v107 = v107.adjustBorders
return v107.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
