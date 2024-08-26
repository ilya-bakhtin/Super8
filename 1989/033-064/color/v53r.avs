import("..\1989-sevas.avs")
v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
b_ex = undefined
v53 = v53.AdjustColor(ou = +20, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.04, lock_chan=0, sat=1.7, gam_mac=true, b_expr=b_ex)
v53 = v53.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.7)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate
