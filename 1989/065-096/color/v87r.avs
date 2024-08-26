import("..\1989-Sevas.avs")
v87 = LSMASHVideoSource(dst_dir + "v87f.mp4").ConvertToYV24()
b_ex = undefined
v87 = v87.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v87 = v87.colorYUV(off_u = -2, off_v = +2)
v87 = v87.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3)
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
v87 = v87.add_blank_audio
return v87.prefetch
#adjustframerate
