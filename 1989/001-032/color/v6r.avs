import("..\1989-Sevas.avs")
v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
b_ex = undefined
v6 = v6.AdjustColor(ou = +20, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v6 = v6.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate
