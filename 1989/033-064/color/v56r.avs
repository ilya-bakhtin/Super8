import("..\1989-sevas.avs")
v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
b_ex = undefined
v56 = v56.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v56 = v56.colorYUV(off_u = -2, off_v = +2)
v56 = v56.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate
