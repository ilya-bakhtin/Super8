import("..\1987-svatba.avs")
v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
b_ex = undefined
v27 = v27.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v27 = v27.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate
