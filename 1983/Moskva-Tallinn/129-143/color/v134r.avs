import("..\1983-Moskva-Tallinn.avs")
v134 = LSMASHVideoSource(dst_dir + "v134f.mp4").ConvertToYV24()
#v134 = v134.deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = true)
b_ex = undefined
v134 = v134.AdjustColor(ou = +12, ov = -4, x=200, y=200, w=-100, h=-100, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v134 = v134.colorYUV(off_u = +10, off_v = -10)
v134 = v134.adjustSize
v134 = v134.assumeFPS(18)
v134 = v134.add_blank_audio
return v134.prefetch
#adjustframerate
