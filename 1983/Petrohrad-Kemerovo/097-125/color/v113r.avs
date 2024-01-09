import("..\1983-Petrohrad-Kemerovo.avs")
v113 = LSMASHVideoSource(dst_dir + "v113f.mp4").ConvertToYV24()
b_ex = undefined
v113 = v113.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v113 = v113.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)
v113 = v113.adjustSize
v113 = v113.assumeFPS(18)
v113 = v113.add_blank_audio
return v113.prefetch
#adjustframerate
