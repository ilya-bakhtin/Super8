import("..\1989-Sevas.avs")
v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
b_ex = undefined
v83 = v83.AdjustColor(ou = +14, ov = -10, x=100, y=10, w=-10, h=-200, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v83 = v83.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.6, border_l=100, border_b=200)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate
