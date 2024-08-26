import("..\1989-Sevas.avs")
v97 = LSMASHVideoSource(dst_dir + "v97f.mp4").ConvertToYV24()
v97_i = v97
b_ex = undefined
v97 = v97.AdjustColor(ou = +10, ov = -7, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v97 = v97.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
v97 = v97.add_blank_audio
return v97.prefetch
#adjustframerate
