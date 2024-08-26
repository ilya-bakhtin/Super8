import("..\1989-sevas.avs")
v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
b_ex = undefined
v43 = v43.AdjustColor(ou = +22, ov = -14, x=10, y=10, w=-200, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v43 = v43.colorYUV(off_u = -2, off_v = +2)
v43 = v43.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.6, border_r=200)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate
