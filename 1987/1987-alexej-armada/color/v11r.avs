import("..\1987-alexej-armada.avs")
v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
b_ex = undefined
v11 = v11.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v11 = v11.colorYUV(off_u = -4, off_v = +4)
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate
