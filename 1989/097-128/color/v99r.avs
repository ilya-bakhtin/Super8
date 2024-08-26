import("..\1989-Sevas.avs")
v99 = LSMASHVideoSource(dst_dir + "v99f.mp4").ConvertToYV24()
b_ex = undefined
v99 = v99.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-600, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v99 = v99.colorYUV(off_u = +2, off_v = -2)
v99 = v99.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
v99 = v99.add_blank_audio
return v99.prefetch
#adjustframerate
