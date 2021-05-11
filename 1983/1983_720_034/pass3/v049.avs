import("..\1983_720_034.avs")
v049 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v049f.avi")
v049 = v049.AdjustColor(ou=24, ov=-12, lo_th=0.0, hi_th=0.1, lock_chan=0, x=300, w=-15, red=0.96, blu=0.98, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v049 = v049.autolevels(filterRadius=9, ignore_low=0.0001)
v049 = v049.convertToYV12
v049 = v049.Filter(th_SAD=1100, th_SADC=1100, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=19)
v049 = v049.removeDirt
#return v049.histogram("levels").prefetch(6)
return v049.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

