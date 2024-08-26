import("..\1989-sevas.avs")
v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
b_ex = undefined
v15 = v15.AdjustColor(ou = +12, ov = -12, x=10, y=10, w=-10, h=-100, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.7, gam_mac=true, b_expr=b_ex)
v15 = v15.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8, border_b = 100)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate
