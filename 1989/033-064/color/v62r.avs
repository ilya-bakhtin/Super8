import("..\1989-sevas.avs")
v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
b_ex = undefined
v62 = v62.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v62 = v62.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v62 = v62.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v62.histogram.prefetch
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate
