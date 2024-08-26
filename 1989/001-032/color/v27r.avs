import("..\1989-sevas.avs")
v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
b_ex = undefined
v27 = v27.AdjustColor(ou = +16, ov = -12, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v27 = v27.colorYUV(off_u = -2, off_v = +2)
v27 = v27.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate
