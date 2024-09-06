import("..\1987-svatba.avs")
v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
v17 = v17.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v17 = v17.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v17 = v17.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v17 = v17.colorYUV(off_u = +2, off_v = -2)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate
