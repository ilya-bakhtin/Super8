import("..\1989-Sevas.avs")
v111 = LSMASHVideoSource(dst_dir + "v111f.mp4").ConvertToYV24()
b_ex = undefined
v111 = v111.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v111 = v111.colorYUV(off_u = -2, off_v = +2)
v111 = v111.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.7)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
v111 = v111.add_blank_audio
return v111.prefetch
#adjustframerate
