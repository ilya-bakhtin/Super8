import("..\1989-sevas.avs")
v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
b_ex = undefined
v63 = v63.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v63 = v63.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003)
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate
