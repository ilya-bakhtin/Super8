import("..\11943 Bakhtin N8 02.720p_05.mov.avs")
v138 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\pass2\v138f.avi")
#v138 = v138.tweak(cont = 1.5, coring = false)
v138 = v138.AdjustColor(ou=2, ov=-6, sat=3, lo_th=0.2, hi_th=0.2, lock_chan=1, red=0.94, blu=1, gam_mac=true)
#v138 = v138.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.94, blu_mul=1).\

v138 = v138.convertToYV12
v138 = v138.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v138 = v138.removeDirt
v138 = v138.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)

v138 = v138.autolevels(gamma=2, ignore_low=0.004, ignore_high=0.004, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#v138 = v138.autolevels(ignore=0.004, gamma=2)

#v138 = v138.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
#            fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2)

#return v138.histogram("levels").prefetch(6)
v138 = v138.adjustBorders
return v138.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)
