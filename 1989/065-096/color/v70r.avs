import("..\1989-Sevas.avs")
v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
b_ex = undefined
v70 = v70.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v70 = v70.colorYUV(off_u = -2, off_v = +2)
v70 = v70.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate
