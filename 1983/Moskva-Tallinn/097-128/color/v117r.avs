import("..\1983-Moskva-Tallinn.avs")
v117 = LSMASHVideoSource(dst_dir + "v117f.mp4").ConvertToYV24()
b_ex = undefined
v117 = v117.AdjustColor(ou = +14, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v117 = v117.adjustSize
v117 = v117.assumeFPS(18)
v117 = v117.add_blank_audio
return v117.prefetch
#adjustframerate
