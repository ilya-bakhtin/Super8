import("..\1989-Sevas.avs")
v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v2 = v2.AdjustColor(ou = +30, ov = -20, x=900, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v2 = v2.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.7)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate
