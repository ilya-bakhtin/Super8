import("..\1989-sevas.avs")
v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
b_ex = undefined
v39 = v39.AdjustColor(ou = +14, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v39 = v39.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate
