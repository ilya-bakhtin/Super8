import("..\1983_720_034.avs")
v039 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v039f.avi")
v039 = v039.AdjustColor(ou=20, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=720, red=0.9, blu=1, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v039 = v039.convertToYV12
v039 = v039.Filter(th_SAD=900, th_SADC=900, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v039 = v039.removeDirt
#return v039.histogram("levels").prefetch(6)
return v039.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

