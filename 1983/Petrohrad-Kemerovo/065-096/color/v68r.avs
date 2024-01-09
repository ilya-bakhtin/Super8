import("..\1983-Petrohrad-Kemerovo.avs")
v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
b_ex = undefined
v68 = v68.AdjustColor(ou = +10, ov = -10, x=100, y=100, w=-100, h=-100, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v68 = v68.colorYUV(off_u = +4, off_v = +2)
v68 = v68.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.009, gamma=1.7, border_l=100, border_t=100, border_r=100, border_b=100)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate
