import("..\1989-Sevas.avs")
v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
b_ex = undefined
v85 = v85.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v85 = v85.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate
