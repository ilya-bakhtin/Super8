import("..\1987-svatba.avs")
v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
b_ex = undefined
v30 = v30.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v30 = v30.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v30 = v30.colorYUV(off_u = +4, off_v = -4)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate
