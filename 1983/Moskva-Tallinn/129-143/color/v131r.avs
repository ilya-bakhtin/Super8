import("..\1983-Moskva-Tallinn.avs")
v131 = LSMASHVideoSource(dst_dir + "v131f.mp4").ConvertToYV24()
b_ex = undefined
v131 = v131.AdjustColor(ou = +8, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v131 = v131.colorYUV(off_u = +6, off_v = -6)
v131 = v131.adjustSize
v131 = v131.assumeFPS(18)
v131 = v131.add_blank_audio
return v131.prefetch
#adjustframerate
