import("..\11943 Bakhtin N8 02.720p_03.mov.avs")
v58 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\pass2\v058f.avi").ConvertToYV24()
v58 = v58.AdjustColor(ou=20, ov=-20, lo_th=0.1, hi_th=0.1, sat=2, red=1, gam_mac=true)
v58 = v58.convertToYV12
v58 = v58.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=6)
v58 = v58.removeDirt
v58 = v58.autolevels(ignore_low=0.003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1.5)
v58 = v58.UnsharpMask(strength=300, radius=5, threshold=1)
#fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
#.ColorYUV(gamma_y=64).
#return v58.histogram("levels").prefetch(6)
v58 = v58.adjustBorders
return v58.assumefps(18).AdjustFrameRate(preset_p = "slow").prefetch(12)
