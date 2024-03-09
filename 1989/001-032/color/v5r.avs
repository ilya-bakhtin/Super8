import("..\1989-Sevas.avs")
v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").ConvertToYV24()
b_ex = undefined
v5 = v5.AdjustColor(ou = +10, ov = -10, x=600, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v5 = v5.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7, border_l=600)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
v5 = v5.add_blank_audio
return v5.prefetch
#adjustframerate
