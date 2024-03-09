import("..\1989-Sevas.avs")
v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
b_ex = undefined
v9 = v9.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate
