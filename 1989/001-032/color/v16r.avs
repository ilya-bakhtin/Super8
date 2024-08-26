import("..\1989-sevas.avs")
v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
b_ex = undefined
v16 = v16.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate
