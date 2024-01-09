import("..\1983-Petrohrad-Kemerovo.avs")
v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
b_ex = undefined
v61 = v61.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v61 = v61.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.01, gamma=1.1)
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate
