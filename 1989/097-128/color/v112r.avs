import("..\1989-Sevas.avs")
v112 = LSMASHVideoSource(dst_dir + "v112f.mp4").ConvertToYV24()
b_ex = undefined
v112 = v112.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v112 = v112.colorYUV(off_u = -2, off_v = +2)
v112 = v112.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.8)
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
v112 = v112.add_blank_audio
return v112.prefetch
#adjustframerate
