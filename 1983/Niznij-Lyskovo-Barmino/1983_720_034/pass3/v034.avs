import("..\1983_720_034.avs")
v034 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v034f.avi")
v034 = v034.trim(1, v034.FrameCount - 20)
v034 = v034.AdjustColor(ou=7, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=15, red=0.98, blu=1, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v034 = v034.convertToYV12
v034 = v034.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v034 = v034.removeDirt
#return v034.histogram("levels").prefetch(6)
return v034.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

