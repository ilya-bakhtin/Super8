import("..\1989-Sevas.avs")
v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
b_ex = undefined
v1 = v1.AdjustColor(ou = +12, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v1 = v1.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate
