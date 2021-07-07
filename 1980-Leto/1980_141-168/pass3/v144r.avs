import("..\11943 Bakhtin N8 02.720p_06.mov.avs")
v144 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\pass2\v144f.avi")
v144 = v144.tweak(cont = 1.5, coring = false)
v144 = v144.AdjustColor(ou=1, ov=-7, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=1, red=0.94, blu=1, gam_mac=true)
#v144 = v144.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.9, blu_mul=1).\

v144 = v144.convertToYV12
v144 = v144.Filter(th_SAD=2000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=4, sigma_c=9)
v144 = v144.removeDirt
v144 = v144.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)

v144 = v144.autolevels(gamma=2, ignore_low=0.004, ignore_high=0.004, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#v144 = v144.autolevels(ignore=0.004, gamma=2)

#v144 = v144.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
#            fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2)

#return v144.histogram("levels").prefetch(6)
v144 = v144.adjustBorders
return v144.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
