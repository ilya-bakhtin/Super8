import("..\1989-sevas.avs")
v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
b_ex = undefined
v26 = v26.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v26 = v26.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate
