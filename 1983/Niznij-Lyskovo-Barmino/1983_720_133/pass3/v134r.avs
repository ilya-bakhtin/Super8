import("1983_720_133.avs")
v134 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v134.avi").convertToYV24
v134 = v134.AdjustColor(ou=20, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=600, red=1, grn=0.96, blu=1, sat=1.5, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,24, 66,33, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="100,70,180,190")
v134_1 = v134.trim(0, 32)
v134_2 = v134.trim(33, -1).ColorYUV(off_u = -6, off_v = 3)
v134_3 = v134.trim(34, -1).ColorYUV(off_u = -10, off_v = 5)
v134_4 = v134.trim(35, -1).ColorYUV(off_u = -6, off_v = 3)
v134_5 = v134.trim(36, 40).ColorYUV(off_u = -14, off_v = 7)
v134_6 = v134.trim(41, 43).ColorYUV(off_u = -19, off_v = 9)
v134_7 = v134.trim(44, -1).ColorYUV(off_u = -17, off_v = 8)
v134_8 = v134.trim(45, 46).ColorYUV(off_u = -11, off_v = 5)
v134_9 = v134.trim(47, 68).ColorYUV(off_u = -7, off_v = 3)
v134_10 = v134.trim(69, 0).ColorYUV(off_u = -5)
v134 = v134_1 + v134_2 + v134_3 + v134_4 + v134_5 + v134_6 + v134_7 + v134_8 + v134_9 + v134_10
v134 = v134.convertToYV12
v134 = v134.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v134 = v134.removeDirt
#return v134.histogram("levels").prefetch(6)
return v134.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
