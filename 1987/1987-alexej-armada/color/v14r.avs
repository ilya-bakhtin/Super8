import("..\1987-alexej-armada.avs")
v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").ConvertToYV24()
b_ex = undefined
v14 = v14.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v14 = v14.colorYUV(off_u = -2, off_v = +2)
v14 = v14.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
v14 = v14.add_blank_audio
return v14.prefetch
#adjustframerate
