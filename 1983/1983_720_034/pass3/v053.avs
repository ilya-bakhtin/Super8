import("..\1983_720_034.avs")
v053 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v053f.avi")
v053 = v053.AdjustColor(ou=18, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=1, x=15, red=1, blu=0.82, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v053 = v053.convertToYV12
v053 = v053.Filter(th_SAD=700, th_SADC=700, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v053 = v053.removeDirt
#return v053.histogram("levels").prefetch(6)
return v053.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

