import("..\1983-Petrohrad-Kemerovo.avs")
v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
v20 = v20.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v20 = v20.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.1)#, autolevel=false, input_low=16, input_high=235)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate
