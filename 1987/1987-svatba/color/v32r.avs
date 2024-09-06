import("..\1987-svatba.avs")
v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
b_ex = undefined
v32 = v32.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate
