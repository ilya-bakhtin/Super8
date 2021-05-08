import("..\1983_720_100.avs")
v129 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\v129ff.avi")
v129 = v129.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, sat=1, blu=1, gam_mac=true,\
    bluePoints="100,70,180,190")
#    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v129_1 = v129.trim(0, 6).tweak(sat=1.8, coring=false)
v129_2 = v129.trim(7, 14).tweak(sat=2, coring=false).ColorYUV(off_u = -8, off_v = 4)
v129_3 = v129.trim(15, 69).tweak(sat=3, coring=false).ColorYUV(off_u = -16, off_v = 8)
v129_4 = v129.trim(70, 0).tweak(sat=2, coring=false)
v129 = v129_1 + v129_2 + v129_3 + v129_4
v129 = v129.convertToYV12
v129 = v129.removeDirt
v129 = v129.Filter(th_SAD=1100, th_SADC=1100, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=6, sigma_c=19)
#return v129.histogram("levels").prefetch(6)
v129 = v129.assumeFPS(18).AdjustFrameRate(preset_p = "slowest")
return v129.prefetch(12)

