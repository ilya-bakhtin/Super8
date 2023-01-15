import("..\1983_720_100.avs")
v130 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v130ff.avi")
v130 = v130.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, sat=1.5, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v130 = v130.convertToYV12
v130 = v130.removeDirt
v130 = v130.Filter(th_SAD=1100, th_SADC=1100, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=12)
#return v130.histogram("levels").prefetch(6)
v130 = v130.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v130.prefetch(12)

