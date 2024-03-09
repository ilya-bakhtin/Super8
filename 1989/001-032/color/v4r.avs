import("..\1989-Sevas.avs")
v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
b_ex = undefined
v4 = v4.AdjustColor(ou = +20, ov = -14, x=300, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=300)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate
