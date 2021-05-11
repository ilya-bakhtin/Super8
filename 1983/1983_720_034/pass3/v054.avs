import("..\1983_720_034.avs")
v054 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v054f.avi")
v054 = v054.AdjustColor(ou=21, ov=-9, lo_th=0.1, hi_th=0.1, lock_chan=1, x=720, red=1, blu=0.86, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v054 = v054.convertToYV12
v054 = v054.Filter(th_SAD=700, th_SADC=900, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v054 = v054.removeDirt
#return v054.histogram("levels").prefetch(6)
return v054.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

