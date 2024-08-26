import("..\1989-Sevas.avs")
v88 = LSMASHVideoSource(dst_dir + "v88f.mp4").ConvertToYV24()
b_ex = undefined
v88 = v88.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v88 = v88.colorYUV(off_u = -2, off_v = +2)
v88 = v88.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
v88 = v88.add_blank_audio
return v88.prefetch
#adjustframerate
