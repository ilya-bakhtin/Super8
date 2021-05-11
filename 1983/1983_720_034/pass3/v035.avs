import("..\1983_720_034.avs")
v035 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v035f.avi")
v035 = v035.trim(0, v035.FrameCount - 6)
v035 = v035.AdjustColor(ou=7, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=720, red=1, blu=0.96, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v035 = v035.convertToYV12
v035 = v035.autolevels
v035 = v035.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v035 = v035.removeDirt
#return v035.histogram("levels").prefetch(6)
return v035.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

