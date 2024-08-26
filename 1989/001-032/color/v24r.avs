import("..\1989-sevas.avs")
v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
b_ex = undefined
v24 = v24.AdjustColor(ou = +26, ov = -16, x=10, y=10, w=-10, h=-300, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v24 = v24.colorYUV(off_u = +2, off_v = -2)
v24 = v24.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8, border_b=300)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate
