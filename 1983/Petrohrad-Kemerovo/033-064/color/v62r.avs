import("..\1983-Petrohrad-Kemerovo.avs")
v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
v62 = v62.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v62 = v62.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v62 = v62.colorYUV(off_u = +2, off_v = -2)
v62 = v62.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.3)
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate
