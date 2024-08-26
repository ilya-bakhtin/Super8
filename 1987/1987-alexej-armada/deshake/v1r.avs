import("..\1987-alexej-armada.avs")
v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
b_ex = undefined
v1 = v1.AdjustColor(ou = +6, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v1 = v1.colorYUV(off_u = -2, off_v = +2)
v1 = v1.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate
