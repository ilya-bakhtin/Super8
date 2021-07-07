import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v068 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\pass2\v068f.avi").ConvertToYV24()
v068 = v068.AdjustColor(ou=13, ov=-34, lo_th=0.2, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=0.96, gam_mac=true)
#v68 = v68.ColorYUV(gain_y=512).AdjustColor(2, -7, 0, 3, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=30, sigma_c=40).\
v068 = v068.convertToYV12
w = v068.width
h = v068.height
v068 = v068.spline64Resize(480, 360)
#v068 = v068.Filter(th_SAD=3000, th_SADC=3000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
#                   truemotion=false, sigma_y=3, sigma_c=3)
v068_0 = v068.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=6, sigma_c=6)
v068_1 = v068.Filter(th_SAD=3000, th_SADC=3000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=3, sigma_c=3)
offset = 42
v068 = v068_0.trim(0, offset) + v068_1.trim(offset+1, 0)
v068 = v068.spline64Resize(w, h)
v068 = v068.removeDirt
v068 = v068.autolevels(ignore_low=0.003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1.5)
v068 = v068.UnsharpMask(strength=300, radius=3, threshold=1)
#return v068.histogram("levels").prefetch(12)
v068 = v068.adjustBorders
return v068.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
