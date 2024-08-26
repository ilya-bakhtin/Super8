import("..\1989-sevas.avs")
v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
b_ex = undefined
v20 = v20.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=2.1, gam_mac=true, b_expr=b_ex)
v20 = v20.colorYUV(off_u = +2, off_v = -2)
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.9)#, border_l=100, border_t=100, border_r=100, border_b=100)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate
