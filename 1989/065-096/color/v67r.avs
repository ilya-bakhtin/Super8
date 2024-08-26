import("..\1989-Sevas.avs")
v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
b_ex = undefined
v67 = v67.AdjustColor(ou = +14, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v67 = v67.colorYUV(off_u = -2, off_v = +2)
v67 = v67.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate
