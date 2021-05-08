import("..\1983_720_100.avs")
v131 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v131ff.avi")
v131 = v131.trim(1,0)
v131 = v131.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, sat=1, blu=1, gam_mac=true,\
    bluePoints="100,70,180,190")
#    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v131_1 = v131.trim(0,37).tweak(sat=1.3, coring=false)
v131_2 = v131.trim(38, 41).tweak(sat=1.4, coring=false).ColorYUV(off_u = -8, off_v = 4)
v131_3 = v131.trim(42, 46).tweak(sat=1.5, coring=false).ColorYUV(off_u = -12, off_v = 6)
v131_4 = v131.trim(47, 59).tweak(sat=1.6, coring=false).ColorYUV(off_u = -16, off_v = 8)
v131_5 = v131.trim(60, 64).tweak(sat=1.7, coring=false).ColorYUV(off_u = -20, off_v = 10)
v131_6 = v131.trim(65, 68).tweak(sat=1.8, coring=false).ColorYUV(off_u = -24, off_v = 12)
v131_7 = v131.trim(69, 96).tweak(sat=1.9, coring=false).ColorYUV(off_u = -28, off_v = 14)
v131_8 = v131.trim(97, 103).tweak(sat=1.9, coring=false).ColorYUV(off_u = -16, off_v = 8)
v131_9 = v131.trim(104, 112).tweak(sat=1.9, coring=false).ColorYUV(off_u = -10, off_v = 5)
v131_10 = v131.trim(113, 117).tweak(sat=1.8, coring=false).ColorYUV(off_u = -10, off_v = 5)
v131_11 = v131.trim(118, 122).tweak(sat=1.4, coring=false)
v131_12 = v131.trim(123, 0).tweak(sat=1.3, coring=false).ColorYUV(off_u = 2, off_v = 2)
v131 = v131_1 + v131_2 + v131_3 + v131_4 + v131_5 + v131_6 + v131_7 + v131_8 + v131_9 + v131_10 + v131_11 + v131_12
v131 = v131.convertToYV12
v131 = v131.removeDirt
v131 = v131.Filter(th_SAD=1100, th_SADC=1100, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=12)
#return v131.histogram("levels").prefetch(6)
v131 = v131.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v131.prefetch(12)

