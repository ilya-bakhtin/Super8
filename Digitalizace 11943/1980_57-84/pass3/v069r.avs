import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v069_0f = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\v069.avi").ConvertToYV24()

v069 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\pass2\v069f.avi").ConvertToYV24()
v069 = v069.autolevels(ignore_low=0.00003, ignore_high=0.003, border_t=200, filterRadius = 1, minRng=0)
v069 = v069.AdjustColor(ou=13, ov=-26, lo_th=0.2, hi_th=0.2, lock_chan=0, sat=1.5, red=0.94, grn=1, blu=0.94, gam_mac=true)
#v68 = v68.ColorYUV(gain_y=512).AdjustColor(2, -7, 0, 3, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=30, sigma_c=40).\
v069 = v069.convertToYV12

w = v069_0f.width
h = v069_0f.height

#v069 = v069.spline64Resize(480, 360)
#v069 = v069.Filter(th_SAD=900, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
#                   truemotion=false, sigma_y=1, sigma_c=2)
v069_0 = v069.Filter(th_SAD=2000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=6, sigma_c=6, prefilter=2, hpad=16, vpad=16)
v069_1 = v069.Filter(th_SAD=900, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                     truemotion=false, sigma_y=1, sigma_c=3, prefilter=2, hpad=16, vpad=16)
o_0 = 29
o_1 = 120
v069 = v069_0.trim(0, o_0) + v069_1.trim(o_0 + 1, o_1) + v069_0.trim(o_1 + 1, 0)
#v069 = v069.spline64Resize(w, h)
v069 = v069.removeDirt
v069 = v069.autolevels(ignore_low=0.003, ignore_high=0.003, filterRadius = 0, minRng=0, gamma=1.5)
#v069 = v069.UnsharpMask(strength=300, radius=3, threshold=1)
#return v069.histogram("levels").prefetch(12)
v069 = v069.adjustBorders
return v069.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
