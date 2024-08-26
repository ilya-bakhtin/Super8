import("..\1987-alexej-armada.avs")
v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
b_ex = undefined
v16 = v16.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v16 = v16.colorYUV(off_u = -4, off_v = +4)
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate
