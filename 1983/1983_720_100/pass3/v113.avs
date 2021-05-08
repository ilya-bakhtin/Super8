import("..\1983_720_100.avs")
v113 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v113ff.avi")
v113 = v113.AdjustColor(ou=10, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=225, sat=2, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v113 = v113.convertToYV12
v113 = v113.removeDirt
v113 = v113.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
#return v113.histogram("levels").prefetch(6)
v113 = v113.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v113.prefetch(12)

