import("..\1983_720_100.avs")
v102 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v102ff.avi")
v102 = v102.trim(1, 0)
#v102 = v102.autolevels(ignore=0.0003, border_l=100, filterRadius = 0, minRng=0)
#v102_ = v102.AdjustColor(ou=10, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, sat=2, gam_mac=true)
v102 = v102.AdjustColor(ou=17, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, sat=2, blu=0.95, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v102 = v102.convertToYV12
v102 = v102.removeDirt
#v102 = v102_.convertToYV12.interleave(v102)
v102 = v102.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v102.histogram("levels").prefetch(6)
v102 = v102.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v102.prefetch(12)

