import("..\1983_720_034.avs")
v066 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v066f.avi")
v066 = v066.AdjustColor(ou=25, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=1, x=600, red=0.9, blu=0.86, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v066 = v066.convertToYV12
v066 = v066.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v066 = v066.removeDirt
#return v066.histogram("levels").prefetch(6)
return v066.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

