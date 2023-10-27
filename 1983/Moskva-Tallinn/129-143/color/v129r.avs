import("..\1983-Moskva-Tallinn.avs")
v129 = LSMASHVideoSource(dst_dir + "v129f.mp4").ConvertToYV24()
b_ex = undefined
v129 = v129.AdjustColor(ou = +12, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
v129 = v129.colorYUV(off_u = +10, off_v = -10)
v129 = v129.adjustSize
v129 = v129.assumeFPS(18)
v129 = v129.add_blank_audio
return v129.prefetch
#adjustframerate
