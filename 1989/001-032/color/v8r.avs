import("..\1989-sevas.avs")
v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
b_ex = undefined
v8 = v8.AdjustColor(ou = +20, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v8 = v8.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate
