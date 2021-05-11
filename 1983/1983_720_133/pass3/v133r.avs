import("1983_720_133.avs")
v133 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v133.avi").convertToYV24
#v133 = v133.trim(1,0)
v133 = v133.AdjustColor(ou=25, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=600, red=1, grn=0.96, blu=1, sat=1.5, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,24, 66,33, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="100,70,180,190")
v133 = v133.convertToYV12
v133 = v133.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v133 = v133.removeDirt
#return v133.histogram("levels").prefetch(6)
return v133.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
