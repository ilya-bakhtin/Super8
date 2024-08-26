import("..\1989-Sevas.avs")
v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
b_ex = undefined
v80 = v80.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v80 = v80.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate
