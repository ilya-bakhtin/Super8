import("..\1983_720_100.avs")
v126 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v126ff.avi")
v126 = v126.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, sat=1.5, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v126 = v126.convertToYV12
v126 = v126.removeDirt
v126 = v126.autolevels(ignore=0.0002, gamma=1.8)
v126 = v126.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=12)
#return v126.histogram("levels").prefetch(6)
v126 = v126.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v126.prefetch(12)
