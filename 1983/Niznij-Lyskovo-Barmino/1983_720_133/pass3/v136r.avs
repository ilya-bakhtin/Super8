import("1983_720_133.avs")
v136 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v136.avi").convertToYV24
#v136 = v136.trim(1,0)
v136 = v136.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=1, sat=1.5, gam_mac=true)#,\
#    bluePoints="0,0, 26, 0, 40,7, 48,24, 66,33, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="100,70,180,190")
v136 = v136.convertToYV12
v136 = v136.Filter(th_SAD=1100, th_SADC=1100, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=6, sigma_c=0)
v136 = v136.removeDirt
#return v136.histogram("levels").prefetch(6)
return v136.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
