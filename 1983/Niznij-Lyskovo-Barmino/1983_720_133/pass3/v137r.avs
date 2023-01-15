import("1983_720_133.avs")
v137 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v137.avi").convertToYV24
v137 = v137.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=0.96, blu=1, sat=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,24, 66,33, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="100,70,180,190")
v137_1 = v137.trim(0, 75).tweak(sat=1.3, coring=false)
v137_2 = v137.trim(76, 81).tweak(sat=1.5, coring=false).ColorYUV(off_u = -8, off_v = 4)
v137_3 = v137.trim(82, 89).tweak(sat=1.7, coring=false).ColorYUV(off_u = -12, off_v = 6).autolevels
v137_4 = v137.trim(90, 99).tweak(sat=1.9, coring=false).ColorYUV(off_u = -19, off_v = 9).autolevels
v137_5 = v137.trim(100, 104).tweak(sat=1.7, coring=false).ColorYUV(off_u = -14, off_v = 7).autolevels
v137_6 = v137.trim(105, 108).tweak(sat=1.5, coring=false).ColorYUV(off_u = -10, off_v = 5)
v137_7 = v137.trim(109, 0).tweak(sat=1.3, coring=false)#.ColorYUV(off_u = 3)
v137 = v137_1 + v137_2 + v137_3 + v137_4 + v137_5 + v137_6 + v137_7
v137 = v137.convertToYV12
v137 = v137.Filter(th_SAD=1100, th_SADC=1100, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=6, sigma_c=0)
v137 = v137.removeDirt
#return v137.histogram("levels").prefetch(6)
return v137.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
