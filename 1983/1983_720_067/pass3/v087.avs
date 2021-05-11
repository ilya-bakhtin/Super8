import("..\1983_720_067.avs")
v087 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\pass2\v087f.avi")
v087 = v087.AdjustColor(ou=15, ov=-12, lo_th=0.05, hi_th=0.1, lock_chan=0, x=15, sat=2, red=0.95, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v087 = v087.convertToYV12
v087 = v087.autogamma(ignore_low=0.002)
v087 = v087.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v087 = v087.removeDirt
#return v087.histogram("levels").prefetch(6)
return v087.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

