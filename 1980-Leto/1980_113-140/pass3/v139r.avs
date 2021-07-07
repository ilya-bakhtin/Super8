import("..\11943 Bakhtin N8 02.720p_05.mov.avs")
v139 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\pass2\v139f.avi")
#v139 = v139.tweak(cont = 1.5, coring = false)
v139 = v139.AdjustColor(ou=2, ov=-6, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=1, red=0.9, blu=1, gam_mac=true)
#v139 = v139.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.9, blu_mul=1).\

v139 = v139.convertToYV12
v139 = v139.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=6, sigma_c=18)
v139 = v139.removeDirt
v139 = v139.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)

v139 = v139.autolevels(gamma=2, ignore_low=0.04, ignore_high=0.004, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#v139 = v139.autolevels(ignore=0.004, gamma=2)

#v139 = v139.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
#            fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2)

#return v139.histogram("levels").prefetch(6)
v139 = v139.adjustBorders
return v139.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)
