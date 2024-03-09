import("..\1989-Sevas.avs")
v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
b_ex = undefined
v18 = v18.AdjustColor(ou = +8, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.7, gam_mac=true, b_expr=b_ex)
v18 = v18.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate
