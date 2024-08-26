import("..\1989-Sevas.avs")
v106 = LSMASHVideoSource(dst_dir + "v106f.mp4").ConvertToYV24()
b_ex = undefined
v106 = v106.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v106 = v106.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
v106 = v106.add_blank_audio
return v106.prefetch
#adjustframerate
