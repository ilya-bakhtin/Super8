import("..\1989-Sevas.avs")
v94 = LSMASHVideoSource(dst_dir + "v94f.mp4").ConvertToYV24()
v94_i = v94
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v94 = v94.AdjustColor(ou = +10, ov = -7, x=800, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v94 = v94.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.5)
v94 = v94.adjustSize
v94 = v94.assumeFPS(18)
v94 = v94.add_blank_audio
return v94.prefetch
#adjustframerate
