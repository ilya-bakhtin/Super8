import("1983_720_133.avs")
v139 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v139.avi").convertToYV24
#v139 = v139.trim(1,0)
v139 = v139.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=1, sat=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,24, 66,33, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="100,70,180,190")
v139_1 = v139.trim(0, 19).tweak(sat=1.5, coring=false)
v139_2 = v139.trim(20, 22).tweak(sat=1.5, coring=false).ColorYUV(off_u = -9, off_v = 4)
v139_3 = v139.trim(23, 24).tweak(sat=1.7, coring=false).ColorYUV(off_u = -20, off_v = 10)
v139_4 = v139.trim(25, 29).tweak(sat=1.9, coring=false).ColorYUV(off_u = -36, off_v = 18)
v139_5 = v139.trim(30, 34).tweak(sat=1.9, coring=false).ColorYUV(off_u = -22, off_v = 11)
v139_6 = v139.trim(35, 41).tweak(sat=1.7, coring=false).ColorYUV(off_u = -10, off_v = 5)
v139_7 = v139.trim(42, 0).tweak(sat=1.5, coring=false)
v139 = v139_1 + v139_2 + v139_3 + v139_4 + v139_5 + v139_6 + v139_7
v139 = v139.convertToYV12
v139 = v139.Filter(th_SAD=1100, th_SADC=1100, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=6, sigma_c=0)
v139 = v139.removeDirt
#return v139.histogram("levels").prefetch(6)
return v139.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
