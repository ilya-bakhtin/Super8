import("1983_720_133.avs")
v148 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v148.avi").convertToYV24
#v148 = v148.trim(1, 0)
v148 = v148.AdjustColor(ou=20, ov=-20, lo_th=0.1, hi_th=0.1, lock_chan=0, x=600, red=0.9, grn=0.96, blu=1, sat=1.5, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="0,0, 26, 0, 40,7, 48,24, 66,33, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="100,70,180,190")
v148 = v148.convertToYV12
v148 = v148.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v148 = v148.removeDirt
v148 = v148.autolevels(ignore=0.0009, gamma=2)
#return v148.histogram("levels").prefetch(6)
return v148.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
