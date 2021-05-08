import("..\1983_720_100.avs")
v124 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v124ff.avi")
v124 = v124.AdjustColor(ou=20, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=525, sat=1.5, red=0.96, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v124 = v124.convertToYV12
v124 = v124.removeDirt
v124 = v124.autolevels(ignore=0.0002, gamma=1.5)
v124 = v124.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=12)
#return v124.histogram("levels").prefetch(6)
v124 = v124.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v124.prefetch(12)

