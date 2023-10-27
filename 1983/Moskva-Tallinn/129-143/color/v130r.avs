import("..\1983-Moskva-Tallinn.avs")
v130 = LSMASHVideoSource(dst_dir + "v130f.mp4").ConvertToYV24()
b_ex = undefined
v130 = v130.AdjustColor(ou = +12, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v130 = v130.colorYUV(off_u = +6, off_v = -6)
v130 = v130.adjustSize
v130 = v130.assumeFPS(18)
v130 = v130.add_blank_audio
return v130.prefetch
#adjustframerate
