import("1983_720_133.avs")
v141 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v141.avi").convertToYV24
#v141 = v141.trim(1,0)
v141 = v141.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=0.96, blu=1, sat=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,24, 66,33, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#    bluePoints="100,70,180,190")
v141_1 = v141.trim(0, 140).tweak(sat=2, coring=false)
v141_2 = v141.trim(141, 154).tweak(sat=2, coring=false).ColorYUV(off_u = -10, off_v = 5)
v141_3 = v141.trim(155, 157).tweak(sat=2, coring=false).ColorYUV(off_u = -16, off_v = 8)
v141_4 = v141.trim(158, 0).tweak(sat=2, coring=false).ColorYUV(off_u = -10, off_v = 5)
v141 = v141_1 + v141_2 + v141_3 + v141_4
v141 = v141.convertToYV12
v141 = v141.Filter(th_SAD=900, th_SADC=900, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v141 = v141.removeDirt
#return v141.histogram("levels").prefetch(6)
return v141.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
