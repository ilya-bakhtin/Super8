import("..\1989-sevas.avs")
v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
b_ex = undefined
v38 = v38.AdjustColor(ou = +14, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v38 = v38.colorYUV(off_u = -2, off_v = -2)
v38 = v38.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate
