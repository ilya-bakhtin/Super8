import("..\1989-Sevas.avs")
v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
b_ex = undefined
v84 = v84.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v84 = v84.colorYUV(off_u = -2, off_v = +2)
v84 = v84.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate
