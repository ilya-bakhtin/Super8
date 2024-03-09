import("..\1989-Sevas.avs")
v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
b_ex = undefined
v17 = v17.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-700, h=-500, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.7, gam_mac=true, b_expr=b_ex)
v17 = v17.colorYUV(off_u = -4, off_v = +4)
v17 = v17.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8, border_r=700, border_b=500)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate
