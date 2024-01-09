import("..\1983-Petrohrad-Kemerovo.avs")
v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
b_ex = undefined
v92 = v92.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v92 = v92.colorYUV(off_u = +4, off_v = -4)
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate
