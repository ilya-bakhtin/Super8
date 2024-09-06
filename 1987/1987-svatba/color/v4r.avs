import("..\1987-svatba.avs")
v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
b_ex = undefined
v4 = v4.AdjustColor(ou = -3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate
