import("..\1987-svatba.avs")
v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
v9 = v9.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v9 = v9.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate
