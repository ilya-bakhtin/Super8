import("..\1983-Moskva-Tallinn.avs")
v124 = LSMASHVideoSource(dst_dir + "v124f.mp4").ConvertToYV24()
b_ex = undefined
v124 = v124.AdjustColor(ou = +10, ov = -6, x=300, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v124 = v124.colorYUV(off_u = +6, off_v = -6)
v124 = v124.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v124 = v124.adjustSize
v124 = v124.assumeFPS(18)
v124 = v124.add_blank_audio
return v124.prefetch
#adjustframerate
