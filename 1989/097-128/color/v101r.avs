import("..\1989-Sevas.avs")
v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
b_ex = undefined
v101 = v101.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v101 = v101.colorYUV(off_u = -2, off_v = +2)
v101 = v101.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate
