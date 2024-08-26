import("..\1989-Sevas.avs")
v72 = LSMASHVideoSource(dst_dir + "v72f.mp4").ConvertToYV24()
b_ex = undefined
v72 = v72.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v72 = v72.colorYUV(off_u = -2, off_v = +2)
v72 = v72.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
v72 = v72.add_blank_audio
return v72.prefetch
#adjustframerate
