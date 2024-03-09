import("..\1989-Sevas.avs")
v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
b_ex = undefined
v3 = v3.AdjustColor(ou = +20, ov = -14, x=800, y=100, w=-200, h=-600, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=800, border_t=100, border_r=200, border_b=600)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate
