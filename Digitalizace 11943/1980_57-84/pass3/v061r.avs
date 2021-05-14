import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v061 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\pass2\v061f.avi").ConvertToYV24()
v061 = v061.AdjustColor(ou=18, ov=-18, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=0.9, gam_mac=true)
#v61 = v61.ColorYUV(gain_y=128).AdjustColor(12, -10, 0, 2, grn_mul=0.96, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=10, sigma_c=20).\
v061 = v061.convertToYV12
v061 = v061.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v061 = v061.removeDirt
v061 = v061.autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1)
v061 = v061.UnsharpMask(strength=300, radius=5, threshold=1)
#return v061.histogram("levels").prefetch(6)
v061 = v061.adjustBorders
return v061.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
