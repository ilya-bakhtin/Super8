import("..\1989-Sevas.avs")
v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
b_ex = undefined
v31 = v31.AdjustColor(ou = +16, ov = -8, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v31 = v31.colorYUV(off_u = +4, off_v = -4)
v31 = v31.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate
