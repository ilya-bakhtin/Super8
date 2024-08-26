import("..\1989-Sevas.avs")
v98 = LSMASHVideoSource(dst_dir + "v98f.mp4").ConvertToYV24()
b_ex = undefined
v98 = v98.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v98 = v98.colorYUV(off_u = +2, off_v = -2)
v98 = v98.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
v98 = v98.add_blank_audio
return v98.prefetch
#adjustframerate
