import("..\1989-sevas.avs")
v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
b_ex = undefined
v28 = v28.AdjustColor(ou = +20, ov = -14, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v28 = v28.colorYUV(off_u = -2, off_v = +2)
v28 = v28.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.7)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate
