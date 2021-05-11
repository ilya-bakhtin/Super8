import("..\1983_720_067.avs")
v070 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\pass2\v070f.avi")
v070 = v070.AdjustColor(ou=25, ov=-15, lo_th=0.05, hi_th=0.1, lock_chan=0, x=600, sat=2, red=0.95, blu=0.9, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v070 = v070.convertToYV12
v070 = v070.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v070 = v070.removeDirt
#return v070.histogram("levels").prefetch(6)
return v070.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

