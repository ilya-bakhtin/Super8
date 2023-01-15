import("..\1983_720_100.avs")
v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v125ff.avi")
v125 = v125.AdjustColor(ou=20, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, sat=2, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v125 = v125.convertToYV12
v125 = v125.removeDirt
v125 = v125.autolevels(ignore=0.0002, gamma=1.5)
v125 = v125.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=12)
#return v125.histogram("levels").prefetch(6)
v125 = v125.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v125.prefetch(12)

