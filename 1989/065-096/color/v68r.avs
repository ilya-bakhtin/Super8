import("..\1989-Sevas.avs")
v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
b_ex = undefined
v68 = v68.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v68 = v68.colorYUV(off_u = -2, off_v = -2)
v68 = v68.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate
