import("..\1987-alexej-armada.avs")
v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
b_ex = undefined
v9 = v9.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v9 = v9.colorYUV(off_u = -2, off_v = +2)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate
