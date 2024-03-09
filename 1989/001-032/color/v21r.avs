import("..\1989-Sevas.avs")
v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").ConvertToYV24()
b_ex = undefined
v21 = v21.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=3., gam_mac=true, b_expr=b_ex)
v21 = v21.colorYUV(off_u = +8, off_v = -4)
v21 = v21.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.6)#, border_l=100, border_t=100, border_r=100, border_b=100)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
v21 = v21.add_blank_audio
return v21.prefetch
#adjustframerate
