import("..\1989-sevas.avs")
v57 = LSMASHVideoSource(dst_dir + "v57f.mp4").ConvertToYV24()
b_ex = undefined
v57 = v57.AdjustColor(ou = +24, ov = -16, x=900, y=300, w=-10, h=-300, lo_th=0.4, hi_th=0.04, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex)
v57 = v57.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.7, border_l=900, border_t=300, border_b=300)
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
v57 = v57.add_blank_audio
return v57.prefetch
#adjustframerate
