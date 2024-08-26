import("..\1989-Sevas.avs")
v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
b_ex = undefined
v77 = v77.AdjustColor(ou = +13, ov = -7, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=3., gam_mac=true, b_expr=b_ex)
v77 = v77.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate
