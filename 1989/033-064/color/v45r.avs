import("..\1989-sevas.avs")
v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
b_ex = undefined
v45 = v45.AdjustColor(ou = +18, ov = -14, x=10, y=10, w=-600, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v45 = v45.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6, border_r=600)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate
