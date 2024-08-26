import("..\1987-alexej-armada.avs")
v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
b_ex = undefined
v8 = v8.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v8 = v8.colorYUV(off_u = -2, off_v = +2)
v8 = v8.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.1)
v8 = v8.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate
