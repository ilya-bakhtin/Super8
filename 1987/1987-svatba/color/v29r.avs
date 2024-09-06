import("..\1987-svatba.avs")
v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
b_ex = undefined
v29 = v29.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v29 = v29.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v29 = v29.colorYUV(off_u = +6, off_v = -8)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate
